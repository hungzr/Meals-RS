from bottle import post,get, run, request, template, route, redirect, response
from pymongo import MongoClient
import ver2
import json
import random

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['user']
collection = db['user_info']
collection_test = db['user_info_test']

meal_id_arr, meal_actual_id, meal_menu, meal_ingre, meal_methods,meal_image, meal_score = ver2.get_meal_infor('../../dataset/csv_file/food/')
default_image = 'https://deptuoi30.com/wp-content/uploads/2019/04/thuc-don-bua-com-gia-dinh-9-600x400.jpg'

def get_user_infor():
    user_account_pass = []
    user_id = []
    for user in collection.find():
        user_account_pass.append((user['user_account'], 
                                    user['user_password']))
        user_id.append(user['user_id'])
    return user_account_pass, user_id

@post('/login')
def do_login():
    username = request.forms.get('username')
    password = request.forms.get('password')

    user_account_pass, user_id = get_user_infor()
    if (username, password) in user_account_pass:
        get_user_id = user_id[user_account_pass.index((username, password))]
        response.set_cookie("user_id", get_user_id, secret='some-secret-key')
        print('login with ID %s' % get_user_id)
    else:
        print('fail')

    redirect('/find')

@get('/logout')
def do_logout():
    response.set_cookie("user_id", None, secret='some-secret-key')
    print('logout successful' )
    redirect('/find')

@post('/register')
def do_register():
    user_account = request.forms.get('register_user_account')
    user_password = request.forms.get('register_user_password')
    user_name = request.forms.get('register_user_name')

    # Find next ID to init
    _, user_id = get_user_infor()
    user_id.sort()
    new_user_id = str(int(user_id[len(user_id) - 1]) + 1)
    dic = {'user_account': user_account, 'user_password': user_password, 
            'user_id': new_user_id, 'user_name': user_name, 'user_gender': '',
            'user_age': '','user_hobbies': [], 'user_group': [], 'user_history': []}

    x = collection_test.insert_one(dic)
    print(dic)
    redirect('/find')


def get_detail(top_rating):
    # Get detail recommended meals
    # Menu
    menu_array = [meal_menu[meal_id_arr.index(i)] for i in top_rating]
    menu_array = [', '.join(recipe for recipe in menu).capitalize() 
                    for menu in menu_array]
    # print('menu: ', menu_array)

    # Images
    image_array = [meal_image[meal_id_arr.index(i)] for i in top_rating]
    # print('image: ', image_array)

    # Ratings
    rating_array = [meal_score[meal_id_arr.index(i)] for i in top_rating]
    # print('rating: ', rating_array)

    return menu_array, image_array, rating_array

def get_topk_rating(k):
    # Top most general meals
    meal_dict = dict(zip(meal_id_arr, meal_score))

    # Shuffle dictionary
    temp = list(meal_dict.items())
    random.shuffle(temp)
    new_meal_dict = dict(temp)
    top_rating = ver2.get_top_k(new_meal_dict, k)

    return top_rating

@post('/find')
def get_recommeded_meals():
    recipe_input = request.forms.recipe_name
    print('input: ', recipe_input)

    get_user_id = request.get_cookie("user_id", secret='some-secret-key')
    if get_user_id is None: get_user_id = ''
    print('user_id: ', get_user_id)

    if recipe_input == '':
        # Most general
        top_rating = get_topk_rating(6)

        menu_array, image_array, rating_array = get_detail(top_rating)
        image_array = [element or default_image for element in image_array]
        # print('new_image: ', image_array)

        return template('index', recipe_input='', user_login_id = get_user_id,
        meal_id = top_rating[:3], recom_image = image_array[:3], recom_rating = rating_array[:3], recom_menu= menu_array[:3],
        more_meal_id = top_rating[3:],more_image = image_array[3:], more_rating = rating_array[3:], more_menu= menu_array[3:]
        )

    else:
        # Recommended
        temp_id = get_user_id
        if get_user_id is None: temp_id = -1
        top_rating = ver2.main_ver2(temp_id, recipe_input)

        # Get detail recommended meals
        menu_array, image_array, rating_array = get_detail(top_rating)
        image_array = [element or default_image for element in image_array]
        # print('new_image: ', image_array)

        # Might care
        top_rating_more = get_topk_rating(3)
        menu_array_more, image_array_more, rating_array_more = get_detail(top_rating_more)
        image_array_more = [element or default_image for element in image_array_more]
        print('new_image: ', image_array_more)
        
        return template('index', recipe_input=recipe_input, user_login_id = get_user_id,
        meal_id = top_rating, recom_image = image_array, recom_rating = rating_array, recom_menu= menu_array,
        more_meal_id = top_rating_more,more_image = image_array_more, more_rating = rating_array_more, more_menu= menu_array_more
        )

@route('/detail/:meal_id')
def meal_detail(meal_id):
    print("meal_id: ", meal_id)
    get_user_id = request.get_cookie("user_id", secret='some-secret-key')
    if get_user_id is None: get_user_id = ''
    print('user_id: ', get_user_id)
    
    
    # Get image
    detail_image = meal_image[meal_id_arr.index(int(meal_id))]
    if detail_image == "":
        detail_image = default_image

    # Get all recipes in menu
    detail_recipes = meal_menu[meal_id_arr.index(int(meal_id))]
    detail_recipes = [str(i + 1) + '. ' + j.capitalize() for i, j in enumerate(detail_recipes)]
    print('recipe: ', detail_recipes)

    # Get all ingredients
    detail_ingre = meal_ingre[meal_id_arr.index(int(meal_id))]
    detail_ingre = detail_ingre.split('|')
    # detail_ingre = ['_ Nguyên liệu: ' + i for i in detail_ingre if i != '']
    print('ingre: ', detail_ingre)

    # Get all methods
    temp_detail_method = meal_methods[meal_id_arr.index(int(meal_id))]
    temp_detail_method = temp_detail_method.split('|')
    detail_method = []
    for i in temp_detail_method:
        if i != '':
            detail_method.append(i.split(';'))
        else:
            detail_method.append([])
    print('method: ', detail_method)

    return template('detail',recipe_input='', user_login_id = get_user_id, detail_image= detail_image,
                    detail_recipe= detail_recipes, detail_ingre= detail_ingre, detail_method= detail_method)

@get('/rating')
def get_rating(value):
    # input_name = request.POST.get('recipe_name')
    # category = request.POST.get('category')
    # correspond = request.POST.get('correspond')
    # result_menu = request.POST.get('result_menu')
    # rate_num = request.POST.get('rate_num')
    # print('------------------')
    # data = {'input_name': input_name, 'category': category,
    #         'correspond': correspond, 'result_menu': result_menu, 'rate_nume': rate_num}
    # return json.dumps(data)
    print(value)


@route('/find')
def find_menu_form():
    get_user_id = request.get_cookie("user_id", secret='some-secret-key')
    if get_user_id is None: get_user_id = ''
    print('user_id: ', get_user_id)
    top_rating = get_topk_rating(6)

    menu_array, image_array, rating_array = get_detail(top_rating)
    image_array = [element or default_image for element in image_array]
    # print('new_image: ', image_array)

    return template('index', recipe_input='',user_login_id = get_user_id,
    meal_id = top_rating[:3], recom_image = image_array[:3], recom_rating = rating_array[:3], recom_menu= menu_array[:3],
    more_meal_id = top_rating[3:],more_image = image_array[3:], more_rating = rating_array[3:], more_menu= menu_array[3:]
    )

run(host='localhost', port=8086)