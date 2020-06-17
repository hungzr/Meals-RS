from bottle import post, run, request, template, route
import ver2
import json

meal_id, meal_actual_id, meal_menu, meal_image, meal_score = ver2.get_meal_infor('../../dataset/csv_file/food/')

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
        return template('/home/ti1070/HungDo/Meals-RS/views/index.tpl', recipe_input='')

    else:
        top_rating = ver2.main_ver2(1, recipe_input)

        # Get detail recommended meals
        # Menu
        menu_array = [meal_menu[meal_id.index(i)] for i in top_rating]
        print(menu_array)
        recom_menu_1, recom_menu_2, recom_menu_3 = menu_array

        # Images
        image_array = [meal_image[meal_id.index(i)] for i in top_rating]
        recom_image_1, recom_image_2, recom_image_3 = image_array

        # Ratings
        rating_array = [meal_score[meal_id.index(i)] for i in top_rating]
        recom_rating_1, recom_rating_2, recom_rating_3 = rating_array
        
        return template('/home/ti1070/HungDo/Meals-RS/views/index.tpl', recipe_input=recipe_input,
        recom_image_1 = recom_image_1, recom_rating_1 = recom_rating_1, recom_menu_1= recom_menu_1,
        recom_image_2 = recom_image_2, recom_rating_2 = recom_rating_2, recom_menu_2= recom_menu_2,
        recom_image_3 = recom_image_3, recom_rating_3 = recom_rating_3, recom_menu_3= recom_menu_3
        )

@route('/find')
def find_menu_form():
    # Top most general meals

    return template('/home/ti1070/HungDo/Meals-RS/views/index.tpl', recipe_input='',
    recom_image_1 = recom_image_1, recom_rating_1 = recom_rating_1, recom_menu_1= recom_menu_1,
    recom_image_2 = recom_image_2, recom_rating_2 = recom_rating_2, recom_menu_2= recom_menu_2,
    recom_image_3 = recom_image_3, recom_rating_3 = recom_rating_3, recom_menu_3= recom_menu_3)

run(host='localhost', port=8086)