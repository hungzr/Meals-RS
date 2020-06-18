import tensorflow as tf
import numpy as np
import meals
import csv
import pandas as pd
import os
from collections import Counter
import time
import sys
sys.path.append('../base_line/')
from ver1 import load_model_category, classify_meal, recommendation

def check_user_infor(file_path, user_id, user_demand):
    '''
    Get user information after login if it existed

    :param file_path: folder path to user information file
    :param user_id: ID of login user if it  available, else is anonymous ID
    :param user_demand: recipe name that user denamded
    :return: DataFrame of user information to merge with recipe_information
    '''

    user_df = pd.read_csv(os.path.join(file_path, 'user_information.csv'))

    user_gender = ''
    user_age = ''
    user_hobbies = ''
    user_health = ''

    for idx, row in user_df.iterrows():
        if user_id == row['user_id']:
            user_gender = row['user_gender']
            user_age = row['user_age']
            user_hobbies = row['user_hobbies']
            user_health = row['user_health']

    user_infor = {'user_id': user_id, 'recipe_name': user_demand, 'user_gender': user_gender,
                  'user_age': user_age, 'user_hobbies': user_hobbies, 'user_health': user_health}

    new_user_df = pd.DataFrame([user_infor])

    # print(new_user_df.T)

    return new_user_df

def load_data(file_path, user_infor):
    '''
    Load user information if demand is available in DB

    :param file_path: folder path to information files
    :param user_infor: DataFrame of user information with the demand
    :return: merged DataFrame if can find suitable meals, else is "0 result" flow
    '''

    recipes = pd.read_csv(os.path.join(file_path, 'recipe_information.csv'))
    df = user_infor.merge(recipes, on="recipe_name", how="left")

    # Load it into df and preprocessing
    df = meals.integerize_ages(dataframe=df)
    df = meals.integerize_healths(dataframe=df)

    # df = df.drop(columns=[meals.ITEM_NAME_COLUMN])

    print(df.T)
    print('------------------------------------------')

    return df

def get_meal_infor(dir_path):
    '''
    Get all meals and the corresponding average scores

    :param dir_path: folder path to meal information
    :return: 3 array meal_id, meal_menu, meal_score
    '''

    meal_menu = []
    meal_id = []
    meal_score = []
    meal_image = []
    meal_actual_id = []
    with open(dir_path + 'meal_information.csv', encoding='utf-8') as mealFile:
        lines = csv.reader(mealFile)
        for line in lines:
            menu = line[2].split(',')
            id = line[0]
            actual_id = line[1]
            score = line[4]
            image = line[3]
            if id != 'meal_id':
                # print(line)
                meal_menu.append(menu)
                meal_id.append(int(id))
                meal_score.append(float(score))
                meal_image.append(image)
                meal_actual_id.append(actual_id)
    
    return meal_id, meal_actual_id, meal_menu, meal_image, meal_score

def find_meal(meal_label_id, meals_label,df):
    '''
    Load user information and mapping with 15 meals in DB

    :param df: user-demand DataFrame
    :return (list): max 15 may suitable meals
    '''

    demand_arr = []; hobbies_arr = []
    for index, row in df.iterrows():
        demand_arr.append(row['recipe_name'])

        temp = row['user_hobbies']
        try:
            temp = temp.split('|')
        except:
            temp = []
        hobbies_arr.append(temp)

    # Mapping for each user demand
    user_meal_arr = []
    for j, user_demand in enumerate(demand_arr):
        # print('user_demand: ', user_demand)

        temp = 0; count_label = 15
        for index, meals in enumerate(meals_label):
            if temp == count_label: break
            for meal in meals:
                if user_demand in meals and any(check in meal for check in hobbies_arr[j]):
                    # print('meal_hobbies - {0}: {1}'.format(meal_label_id[index], meals))
                    user_meal_arr.append(meal_label_id[index])
                    temp += 1
                    break

        current = count_label - temp

        for i in range(current):
            check = False
            for index, meals in enumerate(meals_label):
                if user_demand in meals and meal_label_id[index] not in user_meal_arr:
                    # print('more meals - {0}: {1}'.format(meal_label_id[index], meals))
                    user_meal_arr.append(meal_label_id[index])
                    check = True
                    break
            if check == False:
                user_meal_arr.append(-1)

        user_meal_arr = [int(i) for i in user_meal_arr if i != -1]
        print('user_meal found : ', user_meal_arr)
        # print('--------------------------------------END 1 DEMAND------------------------------------')

    return user_meal_arr

def ranking_meals(df, input_meal_arr):
    '''
    Ranking meals based on user information

    :param df: user-demand DataFrame
    :param input_meal_arr (list): max 15 may suitable meals
    :return (list): Top K highest score meals
    '''

    # Load saved_model
    model = tf.saved_model.load('../deep_learning/tmp/1590133554_wide_deep_update/')

    # Prepare data columns

    result_dict = {}
    for index, row in df.iterrows(): # Each user with 1 demand
        user_id = []
        recipe_id = []
        user_gender = []
        user_age = []
        user_hobbies = []
        user_health = []
        user_history = []
        meals = []

        for meal in input_meal_arr: # Has many might suitable meals

            user_id.append(row['user_id'])
            recipe_id.append(row['recipe_id'])

            temp_gender = row['user_gender']
            user_gender.append(int(temp_gender))

            temp_age = row['user_age']
            user_age.append([int(i) for i in temp_age])

            temp_hobbies = row['user_hobbies']
            user_hobbies.append([int(i) for i in temp_hobbies])

            temp_health = row['user_health']
            user_health.append([int(i) for i in temp_health])

            user_history.append([])

            meals.append(meal)

        # Predict test data
        for i in range(len(user_id)):
            example = tf.train.Example()

            example.features.feature["user_id"].int64_list.value.append(user_id[i])
            example.features.feature["recipe_id"].int64_list.value.append(recipe_id[i])
            example.features.feature["user_gender"].int64_list.value.append(user_gender[i])
            example.features.feature["user_age"].int64_list.value.extend(user_age[i])
            example.features.feature["user_hobbies"].int64_list.value.extend(user_hobbies[i])
            example.features.feature["user_health"].int64_list.value.extend(user_health[i])
            example.features.feature["user_history"].int64_list.value.extend(user_history[i])
            example.features.feature["meals"].int64_list.value.append(meals[i])

            # print('ex: ',example)
            pred = model.signatures["predict"](examples=tf.constant([example.SerializeToString()]))

            # print('pred: ', pred)
            result = np.asarray(pred['predictions'])

            result = result.item()
            result_dict[meals[i]] = result * 5
            print('Score of user {0} with demand {1} for meal {2} is: {3}'.format(user_id[i], recipe_id[i], meals[i], result * 5))
        print('------------------------END FOR 1 USER DEMAND-------------------------------')

    # Get top 3 highest rating
    top_k = get_top_k(result_dict, 3)

    return top_k

def get_top_k(dic, k):
    '''
    Get top K highest values from input

    :param dic: dictionary needs find top K
    :return: array top K highest values
    
    '''
    
    # Get top K highest rating
    prepare = Counter(dic)

    top_high = prepare.most_common(k)
    top_k = [i[0] for i in top_high]

    return top_k

def find_best_meal(meal_id_found, df, meal_id, meal_score):
    """
    Get the final results based on user_information and meals existed or not

    :param meal_id_found: Array of meals found
    :param meal_id: Array of origin meal ID
    :param meal_score: Array of origin meal average score
    :return :final Array TOP 3 suitable meal ID
    """

    top_rating = []
    # < 3 result
    if len(meal_id_found) < 3:
        # Fill untill 3 meals
        meal_dict = dict(zip(meal_id, meal_score))

        # Shuffle dictionary
        import random
        temp = list(meal_dict.items())
        random.shuffle(temp)
        new_meal_dict = dict(temp)
        top_rating_fill = get_top_k(new_meal_dict, 3 - len(meal_id_found))

        meal_id_found.extend(top_rating_fill)
        top_rating = meal_id_found
        print('TOP suitable meals filled: ',top_rating)

    # 3 results
    elif len(meal_id_found) == 3:
        print('TOP suitable meals: ',meal_id_found)
        top_rating = meal_id_found

    # More than 3 results -> ranking by DW ( or most general)
    else:
        if df.at[0, 'user_id'] == -1: # most general
            meal_score_found = [meal_score[meal_id.index(meal)] for meal in meal_id_found]
            result_dict = dict(zip(meal_id_found, meal_score_found))
            top_rating = get_top_k(result_dict, 3)
            print('Non-user information score: ', top_rating)
        
        else: # ranking by DW
            df = meals.integerize_hobbies(dataframe=df)

            top_rating = ranking_meals(df, meal_id_found)
            print('User information score: ', top_rating)

    return top_rating

def main_ver2(user_id, user_demand):
    csv_dir_path = '../../dataset/csv_file/food/'
    # bin_dir_path = '/media/hungdo/DATA/AI/Final_Project/bin_file/'
    bin_dir_path = '/home/ti1070/HungDo/Other_Project/Final-Project/dataset/bin_file/'

    tic = time.time()
    meal_id, meal_actual_id, meal_menu, meal_image, meal_score = get_meal_infor(csv_dir_path)

    
    user_infor = check_user_infor(csv_dir_path, user_id, user_demand)
    df = load_data(csv_dir_path, user_infor)

    top_rating = []
    #If can find suitable meals
    if str(df.at[0, 'recipe_id']) != 'nan': 
        meal_id_found = find_meal(meal_id, meal_menu, df)

        top_rating = find_best_meal(meal_id_found, df, meal_id, meal_score)
        
    # Use other way to find meals -> use FastText for generating meals (or most general)
    else:
        if df.at[0, 'user_id'] == -1: # most general
            meal_dict = dict(zip(meal_id, meal_score))

            # Shuffle dictionary
            import random
            temp = list(meal_dict.items())
            random.shuffle(temp)
            new_meal_dict = dict(temp)
            top_rating = get_top_k(new_meal_dict, 3)
            # print('Non-user information score: ', top_rating)

        else: # Use FastText like ver1
            # Load model_category to classify meal
            model_category = load_model_category(bin_dir_path)

            category = classify_meal(user_demand, model_category)
            print('Nhóm được phân loại: ',category)

            category = category[0]
            recipe_result = recommendation(bin_dir_path, category, user_demand)
            print('Món ăn có sự tương đồng:', recipe_result)

            top_rating = main_ver2(user_id, recipe_result[0])

        # find_best_meal(meal_id_found, df, meal_id, meal_score)

    final_menu_array = [meal_menu[meal_id.index(i)] for i in top_rating]
    for i in range(len(final_menu_array)):
        print('Thực đơn thứ {0} gồm {1}: '.format(i+1, final_menu_array[i]))

    toc = time.time()
    print('The process end in :', toc - tic)

    return top_rating

if __name__ == '__main__':
    user = {
        "user_id": 1,
        "user_demand": "canh bí"
    }

    top_rating = main_ver2(user["user_id"], user["user_demand"])
    print('abc: ', top_rating)

