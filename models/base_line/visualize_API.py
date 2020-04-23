from bottle import post, run, request, template, route
import ver1
import json

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
    if recipe_input == '':
        return template('find_menu', recipe_input='', category='',
                    recipe_result='', menu='')

    category, recipe_result, title_result, string_menu = ver1.main(recipe_input)

    print(category, recipe_result)
    print(title_result, string_menu)
    return template('find_menu', recipe_input=recipe_input, category=category.replace('__label__',''),
                    recipe_result=recipe_result, menu=string_menu)

@route('/find')
def find_menu_form():
    return template('find_menu', recipe_input='', category='',
                    recipe_result='', menu='')
    # return template('<h2>hung</h2>')

run(host='localhost', port=8086)