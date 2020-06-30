from bottle import post,get, run, request, template, route, redirect
from pymongo import MongoClient
import ver2
import json
import random

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['user']
collection = db['user_info']
collection1 = db['user_info1']

meal_id_arr, meal_actual_id, meal_menu, meal_ingre, meal_methods,meal_image, meal_score = ver2.get_meal_infor('../../dataset/csv_file/food/')
default_image = 'https://deptuoi30.com/wp-content/uploads/2019/04/thuc-don-bua-com-gia-dinh-9-600x400.jpg'
id = -1

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
        id = user_id[user_account_pass.index((username, password))]
        print('login with ID %s' % id)
        redirect('/find')
    else:
        print('fail')

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

    x = collection1.insert_one(dic)
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
    print('user_id: ', id)
    print('input: ', recipe_input)

    if recipe_input == '':
        # Most general
        top_rating = get_topk_rating(6)

        menu_array, image_array, rating_array = get_detail(top_rating)
        image_array = [element or default_image for element in image_array]
        # print('new_image: ', image_array)

        return template('index', recipe_input='', user_login_id = '',
        meal_id_1 = top_rating[0], recom_image_1 = image_array[0], recom_rating_1 = rating_array[0], recom_menu_1= menu_array[0],
        meal_id_2 = top_rating[1],recom_image_2 = image_array[1], recom_rating_2 = rating_array[1], recom_menu_2= menu_array[1],
        meal_id_3 = top_rating[2],recom_image_3 = image_array[2], recom_rating_3 = rating_array[2], recom_menu_3= menu_array[2],
        meal_id_4 = top_rating[3],more_image_1 = image_array[3], more_rating_1 = rating_array[3], more_menu_1= menu_array[3],
        meal_id_5 = top_rating[4],more_image_2 = image_array[4], more_rating_2 = rating_array[4], more_menu_2= menu_array[4],
        meal_id_6 = top_rating[5],more_image_3 = image_array[5], more_rating_3 = rating_array[5], more_menu_3= menu_array[5]
        )

    else:
        # Recommended
        top_rating = ver2.main_ver2(1, recipe_input)

        # Get detail recommended meals
        menu_array, image_array, rating_array = get_detail(top_rating)
        image_array = [element or default_image for element in image_array]
        # print('new_image: ', image_array)

        # Might care
        top_rating_more = get_topk_rating(3)
        menu_array_more, image_array_more, rating_array_more = get_detail(top_rating_more)
        image_array_more = [element or default_image for element in image_array_more]
        print('new_image: ', image_array_more)
        
        return template('index', recipe_input=recipe_input, user_login_id = '',
        meal_id_1 = top_rating[0], recom_image_1 = image_array[0], recom_rating_1 = rating_array[0], recom_menu_1= menu_array[0],
        meal_id_2 = top_rating[1],recom_image_2 = image_array[1], recom_rating_2 = rating_array[1], recom_menu_2= menu_array[1],
        meal_id_3 = top_rating[2],recom_image_3 = image_array[2], recom_rating_3 = rating_array[2], recom_menu_3= menu_array[2],
        meal_id_4 = top_rating_more[0],more_image_1 = image_array_more[0], more_rating_1 = rating_array_more[0], more_menu_1= menu_array_more[0],
        meal_id_5 = top_rating_more[1],more_image_2 = image_array_more[1], more_rating_2 = rating_array_more[1], more_menu_2= menu_array_more[1],
        meal_id_6 = top_rating_more[2],more_image_3 = image_array_more[2], more_rating_3 = rating_array_more[2], more_menu_3= menu_array_more[2]
        )

@route('/detail/:meal_id')
def meal_detail(meal_id):
    print("meal_id: ", meal_id)
    
    
    # Get image
    detail_image = meal_image[meal_id_arr.index(int(meal_id))]
    if detail_image == "":
        detail_image = default_image

    # Get all recipes in menu
    detail_recipes = meal_menu[meal_id_arr.index(int(meal_id))]
    detail_recipes = [str(i + 1) + '. ' + j.capitalize() for i, j in enumerate(detail_recipes)]
    count_recipe  = 5 - len(detail_recipes)
    if count_recipe != 0:
        for i in range(count_recipe):
            detail_recipes.append('')
    print(detail_recipes)

    # Get all ingredients
    detail_ingre = meal_ingre[meal_id_arr.index(int(meal_id))]
    detail_ingre = detail_ingre.split('|')
    detail_ingre = ['_ Nguyên liệu: ' + i for i in detail_ingre if i != '']
    count_ingre  = 5 - len(detail_ingre)
    if count_ingre != 0:
        for i in range(count_ingre):
            detail_ingre.append('')
    print(detail_ingre)

    # Get all methods

    return template('detail',recipe_input='', user_login_id = '', detail_image=detail_image,
                    detail_recipe_1= detail_recipes[0], detail_ingre_1 = detail_ingre[0],
                    detail_recipe_2= detail_recipes[1], detail_ingre_2 = detail_ingre[1],
                    detail_recipe_3= detail_recipes[2], detail_ingre_3 = detail_ingre[2],
                    detail_recipe_4= detail_recipes[3], detail_ingre_4 = detail_ingre[3],
                    detail_recipe_5= detail_recipes[4], detail_ingre_5 = detail_ingre[4])

@get('/rating/:value')
def get_rating(value):
    # input_name = request.POST.get('recipe_name')
    # category = request.POST.get('category')
    # correspond = request.POST.get('correspond')
    # result_menu = request.POST.get('result_menu')
    # rate_num = request.POST.get('rate_num')
    # print('------------------')
    # print(input_name)
    # print(category)
    # print(correspond)
    # print(result_menu)
    # print(rate_num)
    # data = {'input_name': input_name, 'category': category,
    #         'correspond': correspond, 'result_menu': result_menu, 'rate_nume': rate_num}
    # return json.dumps(data)
    print(value)


@route('/find')
def find_menu_form():
    print('user_id: ', id)
    top_rating = get_topk_rating(6)

    menu_array, image_array, rating_array = get_detail(top_rating)
    image_array = [element or default_image for element in image_array]
    # print('new_image: ', image_array)

    return template('index', recipe_input='',user_login_id = '1',
    meal_id_1 = top_rating[0], recom_image_1 = image_array[0], recom_rating_1 = rating_array[0], recom_menu_1= menu_array[0],
    meal_id_2 = top_rating[1],recom_image_2 = image_array[1], recom_rating_2 = rating_array[1], recom_menu_2= menu_array[1],
    meal_id_3 = top_rating[2],recom_image_3 = image_array[2], recom_rating_3 = rating_array[2], recom_menu_3= menu_array[2],
    meal_id_4 = top_rating[3],more_image_1 = image_array[3], more_rating_1 = rating_array[3], more_menu_1= menu_array[3],
    meal_id_5 = top_rating[4],more_image_2 = image_array[4], more_rating_2 = rating_array[4], more_menu_2= menu_array[4],
    meal_id_6 = top_rating[5],more_image_3 = image_array[5], more_rating_3 = rating_array[5], more_menu_3= menu_array[5]
    )

run(host='localhost', port=8086)