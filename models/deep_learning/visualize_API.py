from bottle import post, run, request, template, route
# import sys
# sys.path.append('/home/hungdo/HungDo/Meals-RS/views/')
import ver2
import json
import random

meal_id, meal_actual_id, meal_menu, meal_image, meal_score = ver2.get_meal_infor('../../dataset/csv_file/food/')
default_image = 'https://www.mybee.life/static/logo-a9fe68f128e542e8b55c57609fd6e080.png'

def get_detail(top_rating):
    # Get detail recommended meals
    # Menu
    menu_array = [meal_menu[meal_id.index(i)] for i in top_rating]
    menu_array = [', '.join(recipe for recipe in menu).capitalize() 
                    for menu in menu_array]
    print('menu: ', menu_array)

    # Images
    image_array = [meal_image[meal_id.index(i)] for i in top_rating]
    print('image: ', image_array)

    # Ratings
    rating_array = [meal_score[meal_id.index(i)] for i in top_rating]
    print('rating: ', rating_array)

    return menu_array, image_array, rating_array

def get_topk_rating(k):
    # Top most general meals
    meal_dict = dict(zip(meal_id, meal_score))

    # Shuffle dictionary
    temp = list(meal_dict.items())
    random.shuffle(temp)
    new_meal_dict = dict(temp)
    top_rating = ver2.get_top_k(new_meal_dict, k)

    return top_rating

@post('/rating')
def get_rating():
    input_name = request.POST.get('recipe_name')
    category = request.POST.get('category')
    correspond = request.POST.get('correspond')
    result_menu = request.POST.get('result_menu')
    rate_num = request.POST.get('rate_num')
    print('------------------')
    print(input_name)
    print(category)
    print(correspond)
    print(result_menu)
    print(rate_num)
    data = {'input_name': input_name, 'category': category,
            'correspond': correspond, 'result_menu': result_menu, 'rate_nume': rate_num}
    return json.dumps(data)

@post('/find')
def get_recipe_name():
    recipe_input = request.forms.recipe_name
    print(recipe_input)

    if recipe_input == '':
        # Most general
        top_rating = get_topk_rating(6)

        menu_array, image_array, rating_array = get_detail(top_rating)
        image_array = [element or default_image for element in image_array]
        print('new_image: ', image_array)

        return template('index', recipe_input='',
        recom_image_1 = image_array[0], recom_rating_1 = rating_array[0], recom_menu_1= menu_array[0],
        recom_image_2 = image_array[1], recom_rating_2 = rating_array[1], recom_menu_2= menu_array[1],
        recom_image_3 = image_array[2], recom_rating_3 = rating_array[2], recom_menu_3= menu_array[2],
        more_image_1 = image_array[3], more_rating_1 = rating_array[3], more_menu_1= menu_array[3],
        more_image_2 = image_array[4], more_rating_2 = rating_array[4], more_menu_2= menu_array[4],
        more_image_3 = image_array[5], more_rating_3 = rating_array[5], more_menu_3= menu_array[5]
        )

    else:
        # Recommended
        top_rating = ver2.main_ver2(1, recipe_input)

        # Get detail recommended meals
        menu_array, image_array, rating_array = get_detail(top_rating)
        image_array = [element or default_image for element in image_array]
        print('new_image: ', image_array)

        # Might care
        top_rating_more = get_topk_rating(3)
        menu_array_more, image_array_more, rating_array_more = get_detail(top_rating_more)
        image_array_more = [element or default_image for element in image_array_more]
        print('new_image: ', image_array_more)
        
        return template('index', recipe_input=recipe_input,
        recom_image_1 = image_array[0], recom_rating_1 = rating_array[0], recom_menu_1= menu_array[0],
        recom_image_2 = image_array[1], recom_rating_2 = rating_array[1], recom_menu_2= menu_array[1],
        recom_image_3 = image_array[2], recom_rating_3 = rating_array[2], recom_menu_3= menu_array[2],
        more_image_1 = image_array_more[0], more_rating_1 = rating_array_more[0], more_menu_1= menu_array_more[0],
        more_image_2 = image_array_more[1], more_rating_2 = rating_array_more[1], more_menu_2= menu_array_more[1],
        more_image_3 = image_array_more[2], more_rating_3 = rating_array_more[2], more_menu_3= menu_array_more[2]
        )

@route('/find')
def find_menu_form():
    top_rating = get_topk_rating(6)

    menu_array, image_array, rating_array = get_detail(top_rating)
    image_array = [element or default_image for element in image_array]
    print('new_image: ', image_array)

    return template('index', recipe_input='',
    recom_image_1 = image_array[0], recom_rating_1 = rating_array[0], recom_menu_1= menu_array[0],
    recom_image_2 = image_array[1], recom_rating_2 = rating_array[1], recom_menu_2= menu_array[1],
    recom_image_3 = image_array[2], recom_rating_3 = rating_array[2], recom_menu_3= menu_array[2],
    more_image_1 = image_array[3], more_rating_1 = rating_array[3], more_menu_1= menu_array[3],
    more_image_2 = image_array[4], more_rating_2 = rating_array[4], more_menu_2= menu_array[4],
    more_image_3 = image_array[5], more_rating_3 = rating_array[5], more_menu_3= menu_array[5]
    )

run(host='localhost', port=8086)