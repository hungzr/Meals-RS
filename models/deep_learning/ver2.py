import tensorflow as tf
import numpy as np
from training import meals
import csv
import pandas as pd
import os
from collections import Counter
import time
import fasttext
from pymongo import MongoClient

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['user']
collection = db['user_info']
collection_test = db['user_info1']
collection_group = db['user_group']

def load_user_group():
    list_user_group = []
    list_diet_food = []
    for detail in collection_group.find():
        list_user_group.append(detail['group_name'])
        list_diet_food.append(detail['diet_food'])
    
    print(list_diet_food)
    return list_user_group, list_diet_food

def load_model_category(dir_path):
    model_category = fasttext.load_model(os.path.join(dir_path, 'label_model_training.bin'))
    return model_category

def classify_meal(input_recipe, model_category):
    '''
    Classify input recipe

    :param input_recipe: input recipe name
    :param model_category: the loaded fasttext model category
    :return: the name of category  that input recipe belong
    '''

    result = model_category.predict(input_recipe, k=2)
    # print(result[0])
    return result[0]

def get_similarity(model_dir_path, category, input_txt):
    '''
    Find similarity recipe after classify

    :param model_dir_path: folder path to bin files
    :param category: category of input recipe after classify
    :param input_txt: input recipe name
    :return: the similarity recipe name

    '''
    category_label_arr = [('__label__com', 'model_com.bin'), ('__label__khaivi', 'model_khaivi.bin'), ('__label__chay', 'model_chay.bin'),
                          ('__label__man', 'model_man.bin'), ('__label__canh', 'model_canh.bin'), ('__label__trangmieng', 'model_trangmieng.bin'),
                          ('__label__khac', 'model_khac.bin')]

    model_name = next(model for (label, model) in category_label_arr if label == category)
    print("Loaded model: ", model_name)
    # Load the corresponding model and find nearest neighbor recipe
    model = fasttext.load_model(os.path.join(model_dir_path, model_name))
    final_result = model.get_nearest_neighbors(input_txt.replace(' ', '_'), k=2)
    final_result = [result[1].replace('_', ' ') for result in final_result]
    return final_result

def check_user_infor(file_path, user_id, user_demand):
    '''
    Get user information after login if it existed

    :param file_path: folder path to user information file
    :param user_id: ID of login user if it  available, else is anonymous ID
    :param user_demand: recipe name that user denamded
    :return: DataFrame of user information to merge with recipe_information
    '''
    # Get all user infor from CSV file
    # user_df = pd.read_csv(os.path.join(file_path, 'user_information.csv'))

    # user_gender = ''
    # user_age = ''
    # user_hobbies = ''
    # user_health = ''

    # for idx, row in user_df.iterrows():
    #     if user_id == row['user_id']:
    #         user_gender = row['user_gender']
    #         user_age = row['user_age']
    #         user_hobbies = row['user_hobbies']
    #         user_health = row['user_health']

    if user_id != '':
        user_id_arr = []
        user_gender_arr = []
        user_age_arr = []
        user_hobbies_arr = []
        user_group_arr = []
        for user in collection_test.find():
            user_id_arr.append(int(user['user_id']))
            user_gender_arr.append(int(user['user_gender']))
            user_age_arr.append(user['user_age'])
            user_hobbies_arr.append(user['user_hobbies'])
            user_group_arr.append(user['user_group'])
        
        # print(user_id_arr)

        user_gender = user_gender_arr[user_id_arr.index(user_id)]
        user_age = user_age_arr[user_id_arr.index(user_id)]
        user_hobbies = user_hobbies_arr[user_id_arr.index(user_id)]
        user_hobbies = '|'.join(i for i in user_hobbies)
        user_group = user_group_arr[user_id_arr.index(user_id)]  
        user_infor = {'user_id': user_id, 'recipe_name': user_demand, 'user_gender': user_gender,
                    'user_age': user_age, 'user_hobbies': user_hobbies, 'user_health': user_group}
    else:
        user_infor = {'user_id': user_id, 'recipe_name': user_demand, 'user_gender': '',
                    'user_age': '', 'user_hobbies': '', 'user_health': []}

    new_user_df = pd.DataFrame([user_infor])

    print(new_user_df.T)

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

    print(df.T)
    print('------------------------------------------')

    return df

def get_recipe_infor(dir_path):
    '''
    Get all recipes 

    :param dir_path: folder path to recipe information
    :return: 2 array recipe_id, recipe_name
    '''

    recipe_id = []
    recipe_name = []
    with open(dir_path + 'recipe_information.csv', encoding='utf-8') as mealFile:
        lines = csv.reader(mealFile)
        for line in lines:
            temp_id = line[0]
            if temp_id != 'recipe_id':
                recipe_id.append(int(temp_id))
                recipe_name.append(line[1])
    # print(recipe_id)

    return recipe_id, recipe_name

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
    meal_ingre = []
    meal_methods = []
    with open(dir_path + 'meal_information.csv', encoding='utf-8') as mealFile:
        lines = csv.reader(mealFile)
        for line in lines:
            menu = line[2].split(',')
            id = line[0]
            actual_id = line[1]
            score = line[6]
            image = line[5]
            ingredients = line[3]
            methods = line[4]
            # Except title columns
            if id != 'meal_id':
                # print(line)
                meal_menu.append(menu)
                meal_id.append(int(id))
                meal_score.append(float(score))
                meal_image.append(image)
                meal_actual_id.append(actual_id)
                meal_ingre.append(ingredients)
                meal_methods.append(methods)
    
    return meal_id, meal_actual_id, meal_menu, meal_ingre, meal_methods, meal_image, meal_score

def find_meal(meal_id_arr, meal_menu_arr,df):
    '''
    Load user information and mapping with 15 meals in DB

    :param df: User-demand DataFrame
    :param meal_id_arr: Array of all meal_id
    :param meal_menu_arr: Array of all meal menu
    :return (list): Max 15 may suitable meals
    '''
    # Load group
    list_user_group, list_diet_food = load_user_group()
    
    # Load hobbies
    group_arr = []
    for index, row in df.iterrows():
        user_demand = row['recipe_name']

        temp_hobbies = row['user_hobbies']
        try:
            temp_hobbies = temp_hobbies.split('|')
        except:
            temp_hobbies = []
        hobbies_arr = temp_hobbies

        temp_group = row['user_health']
        for i in temp_group:
            j = list_diet_food[list_user_group.index(i)]
            group_arr.extend(j)
    group_arr = list(dict.fromkeys(group_arr)) 

    

    # Mapping for each user demand
    user_meal_arr = []
    ## Demand and hobbies
    temp = 0; count_label = 15
    for index, meals in enumerate(meal_menu_arr):
        if temp == count_label: break
        for meal in meals:
            if (user_demand in meal) and any(check in meal for check in hobbies_arr) :
                # print('meal_hobbies - {0}: {1}'.format(meal_id_arr[index], meals))
                user_meal_arr.append(meal_id_arr[index])
                temp += 1
                break

    current = count_label - temp

    temp1 = 0
    ## Demand
    if current > 0 :
        for index, meals in enumerate(meal_menu_arr):
            if temp1 == current: break
            for meal in meals:
                if (user_demand in meal) and (meal_id_arr[index] not in user_meal_arr) :

                    # print('more meals - {0}: {1}'.format(meal_id_arr[index], meals))
                    user_meal_arr.append(meal_id_arr[index])
                    temp1 += 1
                    break

    current1 = current - temp1
    user_meal_arr_copy = user_meal_arr
    temp2 = 0
    ## Hobbies
    if current1 > 0 and temp1 >= 3 and hobbies_arr != ['']:
        for index, meals in enumerate(meal_menu_arr):
            if temp2/len(user_meal_arr_copy) >= 1/3: break
            for meal in meals:
                if any(check in meal for check in hobbies_arr) and (meal_id_arr[index] not in user_meal_arr):
                    # print('more meals - {0}: {1}'.format(meal_id_arr[index], meals))
                    user_meal_arr.append(meal_id_arr[index])
                    temp2 += 1
                    break
    
    ## User group
    user_meal_arr_copy = user_meal_arr
    if len(user_meal_arr) > 0 and group_arr != []:
        for index in user_meal_arr_copy:
            for meal in meal_menu_arr[index]:
                if any(check in meal for check in group_arr):
                    user_meal_arr.remove(index)
                    break

    user_meal_arr = [int(i) for i in user_meal_arr]
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
    model = tf.saved_model.load('../deep_learning/training/tmp/1587121355_deep/')

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

def find_best_meal(meal_id_found, df, meal_id, meal_score,meal_menu, user_infor):
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
        temp_meal_id_found = []
        try:
            hobbies_arr = user_infor['user_hobbies'].item()
            hobbies_arr = hobbies_arr.split('|')
        except:
            hobbies_arr = []
        print(hobbies_arr)
        for index, menu in enumerate(meal_menu):
            for meal in menu:
                if (meal_id[index] not in meal_id_found) and any(check in meal for check in hobbies_arr):
                    temp_meal_id_found.append(meal_id[index])
                    break
        # print('Meals found by hobbies: ', temp_meal_id_found)

        meal_score_found = [meal_score[meal_id.index(meal)] for meal in temp_meal_id_found]
        result_dict = dict(zip(temp_meal_id_found, meal_score_found))
        # Shuffle dictionary
        import random
        temp = list(result_dict.items())
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
        if df.at[0, 'user_id'] == '': # most general
            meal_score_found = [meal_score[meal_id.index(meal)] for meal in meal_id_found]
            result_dict = dict(zip(meal_id_found, meal_score_found))
            top_rating = get_top_k(result_dict, 3)
            print('Non-user information score: ', top_rating)
        
        else: # ranking by DW
            df = meals.integerize_hobbies(dataframe=df)
            df = meals.integerize_healths(dataframe=df)

            top_rating = ranking_meals(df, meal_id_found)
            print('User information score: ', top_rating)

    return top_rating

def main_ver2(user_id, user_demand):
    # For debug
    csv_dir_path = '/home/hungdo/HungDo/Meals-RS/dataset/csv_file/food/'

    # For running
    csv_dir_path = '../../dataset/csv_file/food/'

    bin_dir_path = '/media/hungdo/DATA/AI/Final_Project/bin_file/'
    # bin_dir_path = '/home/ti1070/HungDo/Other_Project/Final-Project/dataset/bin_file/'

    tic = time.time()
    meal_id, _, meal_menu, _, _, _, meal_score = get_meal_infor(csv_dir_path)

    top_rating = []
    # Check if input is Null
    if user_demand == '':
        # Most general
        if user_id == '':
            meal_dict = dict(zip(meal_id, meal_score))

            # Shuffle dictionary
            import random
            temp = list(meal_dict.items())
            random.shuffle(temp)
            new_meal_dict = dict(temp)
            top_rating = get_top_k(new_meal_dict, 3)
            print('Non-user infor and None-search score: ', top_rating)

        # Recommend by hobbies, health
        else:
            list_user_group, list_diet_food = load_user_group()
            meal_id_found = []
            user_infor = check_user_infor(csv_dir_path, user_id, user_demand)
            try:
                hobbies_arr = user_infor['user_hobbies'].item()
                hobbies_arr = hobbies_arr.split('|')
            except:
                hobbies_arr = []

            group_arr = []
            temp_group = user_infor['user_health'].item()
            for i in temp_group:
                j = list_diet_food[list_user_group.index(i)]
                group_arr.extend(j)
            group_arr = list(dict.fromkeys(group_arr))

            print(hobbies_arr, group_arr)
            for index, meals in enumerate(meal_menu):
                for meal in meals:
                    if any(check in meal for check in hobbies_arr):
                        meal_id_found.append(meal_id[index])
                        break

            
            meal_id_found_copy = meal_id_found
            if len(meal_id_found) > 5 and group_arr != []:
                for index in meal_id_found_copy:
                    for meal in meal_menu[index]:
                        if any(check in meal for check in group_arr):
                            meal_id_found.remove(index)
                            break
            # print('Meals found by hobbies: ', meal_id_found)

            meal_score_found = [meal_score[meal_id.index(meal)] for meal in meal_id_found]
            result_dict = dict(zip(meal_id_found, meal_score_found))
            # Shuffle dictionary
            import random
            temp = list(result_dict.items())
            random.shuffle(temp)
            new_meal_dict = dict(temp)
            top_rating = get_top_k(new_meal_dict, 3)
            print('User infor and None-search score: ', top_rating)
    
    else:
        recipe_id, recipe_name = get_recipe_infor(csv_dir_path)

        user_infor = check_user_infor(csv_dir_path, user_id, user_demand)
        df = load_data(csv_dir_path, user_infor)
        meal_id_found = find_meal(meal_id, meal_menu, df)

        #If can't find suitable meals - > Use FastText like ver1
        if len(meal_id_found) == 0:
            # Load model_category to classify meal
            model_category = load_model_category(bin_dir_path)

            category = classify_meal(user_demand, model_category)
            print('Nhóm được phân loại: ',category)

            category = category[0]
            similarity_result = get_similarity(bin_dir_path, category, user_demand)
            user_demand = similarity_result[0]
            print('Món ăn có sự tương đồng:', similarity_result)

            df['recipe_name'] = user_demand
            df['recipe_id'] = recipe_name.index(user_demand)
            print(df.T)
            meal_id_found = find_meal(meal_id, meal_menu, df)
        else:
            if user_demand not in recipe_name:
                df['recipe_id'] = -1
                print(df.T)

        top_rating = find_best_meal(meal_id_found, df, meal_id, meal_score, meal_menu, user_infor)
        

    final_menu_array = [meal_menu[meal_id.index(i)] for i in top_rating]
    for i in range(len(final_menu_array)):
        print('Thực đơn thứ {0} gồm {1}: '.format(i+1, final_menu_array[i]))

    toc = time.time()
    print('The process end in :', toc - tic)

    return top_rating

if __name__ == '__main__':
    user = {
        "user_id": 0,
        "user_demand": "su su luộc"
    }

    top_rating = main_ver2(user["user_id"], user["user_demand"])
    print('abc: ', top_rating)

