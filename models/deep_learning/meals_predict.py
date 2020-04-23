import tensorflow as tf
import numpy as np
import meals
import csv
import pandas as pd
import os
from collections import Counter

def load_data(file_path):
    # Read testing CSV
    # df = pd.read_csv(file_path)
    user_menu = pd.read_csv(os.path.join(file_path, 'user_information_class.csv'))
    recipes = pd.read_csv(os.path.join(file_path, 'recipe_information.csv'))
    df = user_menu.merge(recipes, on="recipe_name")

    # Load it into df and preprocessing
    df = meals.integerize_ages(dataframe=df)
    df = meals.integerize_healths(dataframe=df)

    # df = df.drop(columns=[meals.ITEM_NAME_COLUMN])
    df_label = pd.DataFrame([df.pop(x) for x in ['top1_meals', 'top2_meals', 'top3_meals',
                                                 'top4_meals', 'top5_meals']]).T

    print(df.T)
    # print(df_label)
    print('------------------------------------------')

    return df, df_label

def find_meal(df):
    # Load user information and mapping with 15 meals in DB
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
    meal_arr = []
    for j, user_demand in enumerate(demand_arr):
        # print('user_demand: ', user_demand)

        user_meal_arr = []
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
        # print('user_meal found : ', user_meal_arr)
        # print('--------------------------------------END 1 DEMAND------------------------------------')
        meal_arr.append(user_meal_arr)

    return meal_arr

def evaluate_data(df, input_meal_arr):
    # Load saved_model
    model = tf.saved_model.load(
        '../deep_learning/tmp/1587121355_new/')

    # Prepare data columns
    rating = []

    for index, row in df.iterrows(): # Each user with 1 demand
        user_id = []
        recipe_id = []
        user_gender = []
        user_age = []
        user_hobbies = []
        user_health = []
        user_history = []
        meals = []

        for meal in input_meal_arr[index]: # Has many might suitable meals

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
        result_dict = {}
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
        #     print('Score of user {0} with demand {1} for meal {2} is: {3}'.format(user_id[i], recipe_id[i], meals[i], result * 5))
        # print('------------------------END FOR 1 USER DEMAND-------------------------------')
        # print(temp)
        rating.append(result_dict)

    return rating

def cal_acc(rating_arr, df_label):
    # Get top 3 score in rating array
    top_arr = []
    for rating in rating_arr: # For each user's demand
        k = Counter(rating)

        # Finding 3 highest values
        top_high = k.most_common(3)
        temp = [i[0] for i in top_high]
        top_arr.append(temp)


    # Get 3labels for checking
    count = 0
    for index, row in df_label.iterrows():
        label_arr = []
        label_arr.append(row['top1_meals'])
        label_arr.append(row['top2_meals'])
        label_arr.append(row['top3_meals'])

        label_arr = [int(i) for i in label_arr if str(i) != 'nan']
        if (set(label_arr) == set(top_arr[index])) and (len(label_arr) == len(top_arr[index])):
            count += 1
        print('label: ',label_arr)
        print('predict: ', top_arr[index])
        print('----------------END 1 ROW--------------')
    print('acc: ', count /len(rating_arr))

def main():
    file_path = '../../dataset/csv_file/food/'

    df, df_label = load_data(file_path)
    input_meal_arr = find_meal(df)
    df = meals.integerize_hobbies(dataframe=df)

    rating = evaluate_data(df, input_meal_arr)

    cal_acc(rating, df_label)

if __name__ == '__main__':
    main()

