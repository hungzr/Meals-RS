#coding: utf-8
from bottle import post,get, run, request, template, route, redirect, response
from pymongo import MongoClient
import ver2
import json
import random

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['user']
collection = db['user_info']
collection_test = db['user_info1']
collection_hobbies = db['recipe_groups']
collection_group = db['user_group']

meal_id_arr, meal_actual_id, meal_menu, meal_ingre, meal_methods,meal_image, meal_score = ver2.get_meal_infor('../../dataset/csv_file/food/')
default_image = 'https://deptuoi30.com/wp-content/uploads/2019/04/thuc-don-bua-com-gia-dinh-9-600x400.jpg'

#get recipe_group
list_hobbies = []
for detail in collection_hobbies.find():
    list_hobbies.append(detail['recipe_group'])

#get_user_group
list_user_group = []
for detail in collection_group.find():
    list_user_group.append(detail['group_name'])

# get_user_infor
user_account_pass = []
user_id = []
user_gender = []
user_age = []
user_hobbies = []
user_group = []
for user in collection_test.find():
    user_account_pass.append((user['user_account'], 
                                user['user_password']))
    user_id.append(user['user_id'])
    user_gender.append(user['user_gender'])
    user_age.append(user['user_age'])
    user_hobbies.append(user['user_hobbies'])
    user_group.append(user['user_group'])

def clean_user_infor(get_user_id):

    get_user_gender = user_gender[user_id.index(get_user_id)]
    if get_user_gender == '0':
        get_user_gender = 'Nam'
    else:
        get_user_gender = 'Nữ'

    get_user_age = user_age[user_id.index(get_user_id)]
    if get_user_age == "trẻ em":
        get_user_age = "0-16 tuổi: Trẻ em"
    elif get_user_age == "người lớn":
        get_user_age = "17-50 tuổi: Người lớn"
    else:
        get_user_age = "> 50 tuổi: Người già"

    get_user_group = user_group[user_id.index(get_user_id)]
    get_user_group = ", ".join(i for i in get_user_group)

    get_user_hobbies = user_hobbies[user_id.index(get_user_id)]
    get_user_hobbies = ", ".join(i for i in get_user_hobbies)

    return get_user_gender, get_user_age, get_user_group, get_user_hobbies

@post('/login')
def do_login():
    username = request.forms.get('username')
    password = request.forms.get('password')

    if (username, password) in user_account_pass:
        get_user_id = user_id[user_account_pass.index((username, password))]
        response.set_cookie("user_id", get_user_id, secret='some-secret-key')
        print('login with ID %s' % get_user_id)

        # # Following infor
        # get_user_gender, get_user_age, get_user_group, get_user_hobbies = clean_user_infor(get_user_id)
        # response.set_cookie("user_gender", get_user_gender, secret='some-secret-key')
        # response.set_cookie("user_age", get_user_age, secret='some-secret-key')
        # response.set_cookie("user_group", get_user_group, secret='some-secret-key')
        # response.set_cookie("user_hobbies", get_user_hobbies, secret='some-secret-key')
    else:
        print('fail')

    redirect('/')

@get('/logout')
def do_logout():
    response.set_cookie("user_id", None, secret='some-secret-key')
    print('logout successful' )
    redirect('/')

@post('/register')
def do_register():
    user_account = request.forms.get('register_user_account')
    user_password = request.forms.get('register_user_password')
    user_name = request.forms.get('register_user_name')

    # Find next ID to init
    user_id.sort()
    new_user_id = str(int(user_id[len(user_id) - 1]) + 1)
    dic = {'user_account': user_account, 'user_password': user_password, 
            'user_id': new_user_id, 'user_name': user_name, 'user_gender': '',
            'user_age': '','user_hobbies': [], 'user_group': [], 'user_history': []}

    x = collection_test.insert_one(dic)
    print(dic)
    redirect('/')

# Get detail recommended meals
def get_detail(top_rating):
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

@post('/advance_search')
def use_advance_search():
    advance_user_gender = request.forms.advance_user_gender
    advance_user_age = request.forms.advance_user_age
    advance_user_group = request.POST.getall('advance_user_group')
    advance_user_hobbies = request.forms.getlist('advance_user_hobbies')
    ab = {'gender':advance_user_gender, 'age':advance_user_age,
          'group': advance_user_group, 'hobbies':advance_user_hobbies}
    print('abc: ',ab)

    redirect('/')

@post('/find')
def get_recommeded_meals():
    recipe_input = request.forms.recipe_name
    print('input: ', recipe_input)

    get_user_id = request.get_cookie("user_id", secret='some-secret-key')
    if get_user_id is None: 
        get_user_id = ''
        get_user_gender, get_user_age, get_user_group, get_user_hobbies = '', '', '', ''
    else:
        # Clean user infor
        get_user_gender, get_user_age, get_user_group, get_user_hobbies = clean_user_infor(get_user_id)

    print('user_id: ', get_user_id)

    if recipe_input == '':
        # Most general
        top_rating = get_topk_rating(6)

        menu_array, image_array, rating_array = get_detail(top_rating)
        image_array = [element or default_image for element in image_array]
        # print('new_image: ', image_array)

        return template('index', recipe_input='', user_login_id = get_user_id,select_group = list_user_group, select_hobbies = list_hobbies,
        user_gender = get_user_gender, user_age = get_user_age, 
        user_group = get_user_group, user_hobbies = get_user_hobbies,
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
        
        return template('index', recipe_input=recipe_input, user_login_id = get_user_id,select_group = list_user_group, select_hobbies = list_hobbies,
        user_gender = get_user_gender, user_age = get_user_age, 
        user_group = get_user_group, user_hobbies = get_user_hobbies,
        meal_id = top_rating, recom_image = image_array, recom_rating = rating_array, recom_menu= menu_array,
        more_meal_id = top_rating_more,more_image = image_array_more, more_rating = rating_array_more, more_menu= menu_array_more
        )

@route('/detail/:meal_id')
def meal_detail(meal_id):
    print("meal_id: ", meal_id)
    get_user_id = request.get_cookie("user_id", secret='some-secret-key')
    if get_user_id is None: 
        get_user_id = ''
        get_user_gender, get_user_age, get_user_group, get_user_hobbies = '', '', '', ''
    else:
        # Clean user infor
        get_user_gender, get_user_age, get_user_group, get_user_hobbies = clean_user_infor(get_user_id)

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

    return template('detail',recipe_input='', user_login_id = get_user_id, select_group = list_user_group, select_hobbies = list_hobbies,
                    user_gender = get_user_gender, user_age = get_user_age, 
                    user_group = get_user_group, user_hobbies = get_user_hobbies,
                    detail_image= detail_image, detail_recipe= detail_recipes, 
                    detail_ingre= detail_ingre, detail_method= detail_method)

@post('/saveinfor')
def save_user_infor():
    get_user_id = request.get_cookie("user_id", secret='some-secret-key')
    get_user_gender = user_gender[user_id.index(get_user_id)]
    get_user_age = user_age[user_id.index(get_user_id)]

    new_user_gender = request.forms.new_user_gender
    if new_user_gender == '':
        new_user_gender = get_user_gender
    new_user_age = request.forms.new_user_age
    if new_user_age == '':
        new_user_age = get_user_age
    new_user_group = request.POST.getall('new_user_group')
    new_user_group = [list_user_group[int(i)] for i in new_user_group]

    new_user_hobbies = request.forms.getlist('new_user_hobbies')
    new_user_hobbies = [list_hobbies[int(i)] for i in new_user_hobbies]
    ab = {'gender':new_user_gender, 'age':new_user_age,
          'group': new_user_group, 'hobbies':new_user_hobbies}
    print('abc: ',ab)

    # Save new infor
    collection_test.update_one(
        {'user_id': get_user_id},
        {
          '$set':
          {
              'user_gender': new_user_gender,
              'user_age': new_user_age,
              'user_group': new_user_group,
              'user_hobbies': new_user_hobbies
          }  
        }
    )

    redirect('/')

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


@route('/')
def find_menu_form():
    get_user_id = request.get_cookie("user_id", secret='some-secret-key')
    if get_user_id is None: 
        get_user_id = ''
        get_user_gender, get_user_age, get_user_group, get_user_hobbies = '', '', '', ''
    else:
        # Clean user infor
        get_user_gender, get_user_age, get_user_group, get_user_hobbies = clean_user_infor(get_user_id)

    # print(get_user_gender, get_user_age, get_user_group, get_user_hobbies)
    print('user_id: ', get_user_id)

    top_rating = get_topk_rating(6)

    menu_array, image_array, rating_array = get_detail(top_rating)
    image_array = [element or default_image for element in image_array]
    # print('new_image: ', image_array)

    return template('index', recipe_input='',user_login_id = get_user_id, select_group = list_user_group, select_hobbies = list_hobbies,
    user_gender = get_user_gender, user_age = get_user_age, 
    user_group = get_user_group, user_hobbies = get_user_hobbies,
    meal_id = top_rating[:3], recom_image = image_array[:3], recom_rating = rating_array[:3], recom_menu= menu_array[:3],
    more_meal_id = top_rating[3:],more_image = image_array[3:], more_rating = rating_array[3:], more_menu= menu_array[3:]
    )

run(host='localhost', port=8086)