import tensorflow as tf
import numpy as np
import meals
import csv
import pandas as pd
import os
from collections import Counter
import time

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

    print(new_user_df)

    return new_user_df

def load_data(file_path, user_infor):
    '''
    Load user information if demand is available in DB

    :param file_path: folder path to information files
    :param user_infor: DataFrame of user information with the demand
    :return: merged DataFrame if can find suitable meals, else is 0 result flow
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


def find_meal(df):
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

    # Label for mapping
    meals_label = []
    meal_label_id = []
    dir_path = '../../dataset/csv_file/food/'
    with open(dir_path + 'meal_information.csv', encoding='utf-8') as mealFile:
        lines = csv.reader(mealFile)
        for line in lines:
            menu = line[2].split(',')
            id = line[0]
            if menu != '[]' and menu != 'recipes':
                # print(line)
                meals_label.append(menu)
                meal_label_id.append(id)

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
    model = tf.saved_model.load(
        '../deep_learning/tmp/1587121355_new/')

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
    k = Counter(result_dict)

    # Finding 3 highest values
    top_high = k.most_common(3)
    top_k = [i[0] for i in top_high]

    return top_k


def main():
    file_path = '../../dataset/csv_file/food/'

    tic = time.time()
    user_infor = check_user_infor(file_path, 16, 'canh cá thu nấu ngót')

    df = load_data(file_path, user_infor)
    if str(df.at[0, 'recipe_id']) != 'nan': #If can find suitable meals
        input_meal_arr = find_meal(df)
        # 3 result
        if len(input_meal_arr) <=3:
            print(input_meal_arr)

        # More than 3 results -> ranking
        else:
            df = meals.integerize_hobbies(dataframe=df)

            top_rating = ranking_meals(df, input_meal_arr)
            print(top_rating)


    else:# Use other way to find meals -> most general
        print('0 result')

    toc = time.time()
    print('The process end in :', toc - tic)

if __name__ == '__main__':
    main()

