import pandas as pd
from pymongo import MongoClient
import csv
import os
from statistics import mean


client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['menu_list']

def cal_rating(dir_path):
    meal_csv = pd.read_csv(dir_path + 'meal_information.csv')
    meal_id = meal_csv.meal_id

    user_csv = pd.read_csv(dir_path + 'user_information_re.csv')
    meals = user_csv.meals
    rating = user_csv.rating

    average_rating_arr = []
    for i in meal_id:
        temp_rating_arr = []
        for index, check in enumerate(meals):
            if int(i) == int(check):
                temp_rating_arr.append(int(rating[index]))

        try:
            average = mean(temp_rating_arr)
        except:
            average = 0
        average_rating_arr.append(round(average,2))

        # print('Array mean rating of meal {0} is {1}: '.format(i, round(average,2)))
        # print('------------------END 1 MEAL_ID------------------')

    return average_rating_arr

def get_meals(db_name, average_rating_arr):
    collection = db[db_name]

    count = 0
    meal_id_arr = []
    actual_id_arr = []
    recipes_arr = []
    image_arr = []
    total_average_rating_arr = []

    for dic in collection.find():
        meal_id_arr.append(count)
        actual_id_arr.append(dic['_id'])
        image_arr.append(dic['image'])

        temp_recipes = ''
        menu = dic['menu']
        # Get all recipe name in DB
        for recipes in menu:
            recipe_name = recipes['name'].replace('\n', ' ').replace('\xa0', '').replace('.', '').strip()
            print('name: ', recipe_name)
            temp_recipes += recipe_name + ','

        recipes_arr.append(temp_recipes[:-1])

        total_average_rating_arr.append(average_rating_arr[count])

        count += 1

    result = {'meal_id': meal_id_arr, 'actual_id': actual_id_arr, 'recipes': recipes_arr,
              'image': image_arr, 'average_rating': total_average_rating_arr}

    print(result)
    return result

def main():
    dir_path = '/media/hungdo/SYSTEM/Users/HungDo/Documents/GitHub/FinalProject_RecommendationSys/dataset/csv_file/food/'
    average_rating_arr = cal_rating(dir_path)

    db_name = 'list_menu'
    result = get_meals(db_name, average_rating_arr)

    df = pd.DataFrame(result, columns=['meal_id', 'actual_id', 'recipes', 'image', 'average_rating'])
    export = df.to_csv(dir_path + 'meal_information.csv',
                       index=None, encoding='utf-8')

if __name__ == '__main__':
    main()