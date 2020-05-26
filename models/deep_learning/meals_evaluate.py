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

def pred_meal(df, input_meal_arr):
    # Load saved_model
    model = tf.saved_model.load(
        '../deep_learning/tmp/1590133554_wide_deep_update/')

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


def apk(actual, predicted, k=10):
    """
    Computes the average precision at k.
    This function computes the average prescision at k between two lists of
    items.
    Parameters
    ----------
    actual : list
             A list of elements that are to be predicted (order doesn't matter)
    predicted : list
                A list of predicted elements (order does matter)
    k : int, optional
        The maximum number of predicted elements
    Returns
    -------
    score : double
            The average precision at k over the input lists
    """
    if len(predicted)>k:
        predicted = predicted[:k]

    score = 0.0
    num_hits = 0.0

    for i,p in enumerate(predicted):
        if p in actual and p not in predicted[:i]:
            num_hits += 1.0
            score += num_hits / (i+1.0)

    if not actual:
        return 0.0

    return score / min(len(actual), k)

def mapk(actual, predicted, k=10):
    """
    Computes the mean average precision at k.
    This function computes the mean average prescision at k between two lists
    of lists of items.
    Parameters
    ----------
    actual : list
             A list of lists of elements that are to be predicted 
             (order doesn't matter in the lists)
    predicted : list
                A list of lists of predicted elements
                (order matters in the lists)
    k : int, optional
        The maximum number of predicted elements
    Returns
    -------
    score : double
            The mean average precision at k over the input lists
    """
    return np.mean([apk(a,p,k) for a,p in zip(actual, predicted)])

def cal_recoms(pred, actual):
    '''
    Calculate recoms array

    :param pred: Array of meal_id predicted [meal_id_found, ...]
    :param actual: Array of meal_id label

    :return: Array of binary [1,0,0] with 1 is True
    '''

    recoms = []
    for id in pred:
        if id in actual:
            recoms.append(1)
        else:
            recoms.append(0)

    return recoms

def cal_ap(recoms, num_actual_add):
    '''
    Calculate AP by calculating Precision and Recall

    :param recoms: Array of binary [1,0,0] with 1 is True
    :param num_actual_add: number of labels

    :return: result of AP
    '''

    precs = []
    recalls = []

    for indx, rec in enumerate(recoms):
        precs.append(sum(recoms[:indx+1])/(indx+1))
        recalls.append(sum(recoms[:indx+1])/num_actual_add)
    ap = (1/num_actual_add) * (sum(precs[i]*recoms[i] for i in range(len(recoms))))

    # print('Precision final: ',precs)
    # print('Recall final: ', recalls)
    # print('AP final: ', ap)
    
    return ap

def evaluate_model(rating_arr, df_label):
    '''
    Get Top K rating to compare with K labels and calculate evaluation metrics

    :param rating_arr: Array of dict - [{meal_id: meal_score}, {}]
    :param df_label: DataFrame contain labels to extract

    :return : + AP: if calculate in all dataset
              + mAP: if calculate AP for each record (row)
              + Acc: Accuracy of TOP K 
    '''


    # Get top K score in rating array
    top_k = 3
    top_arr = []
    for rating in rating_arr: # For each user's demand
        k = Counter(rating)

        # Finding 3 highest values
        top_high = k.most_common(top_k)
        temp = [i[0] for i in top_high]
        top_arr.append(temp)


    # Get K labels for checking
    count = 0
    recoms_arr = []
    ap_arr = []
    for index, row in df_label.iterrows():
        label_arr = []
        label_arr.append(row['top1_meals'])
        if top_k == 2:
            label_arr.append(row['top2_meals'])
        if top_k == 3:
            label_arr.append(row['top2_meals'])
            label_arr.append(row['top3_meals'])

        label_arr = [int(i) for i in label_arr if str(i) != 'nan']
        if (set(label_arr) == set(top_arr[index])) and (len(label_arr) == len(top_arr[index])):
            count += 1
        # print('label: ',label_arr)
        # print('predict: ', top_arr[index])

        if len(label_arr) != 0:
            recoms = cal_recoms(top_arr[index], label_arr)

            # Calculate AP for each record
            # ap = cal_ap(recoms, len(label_arr))
            ap = apk(label_arr, top_arr[index], top_k)
            ap_arr.append(ap)

            # Calculate Precision, Recall, AP for all data
            recoms_arr.extend(recoms)
            
        # print('----------------END 1 ROW--------------')

    final_ap = cal_ap(recoms_arr, len(recoms_arr))
    print('Accuracy of TOP {0} is: {1} '.format(top_k, round((count /len(rating_arr)) * 100, 2)))
    print('AP for all dataset is: ', round(final_ap * 100, 2))
    print('Mean Average Precision for each record is: ', round((sum(i for i in ap_arr)/ len(top_arr)) * 100, 2))


def get_top_k(dict_val ,top_k):
    # Get top value by rank rating
    k = Counter(dict_val)

    # Finding K highest values
    top_high = k.most_common(top_k)
    top_values = [i[0] for i in top_high]

    return top_values

def prepare_class_probs(rating, top_k, num_of_rating):
    class_probs = []              
    top_value = get_top_k(rating, top_k)

    for i in range(num_of_rating):
        # Number of pred < label
        if len(top_value) < num_of_rating:
            class_probs.append(rating)

        # Number of pred > label
        else:
            if i!= 0:
                rating[top_value[i-1]] = 0
            # print('new_rating: ', rating)
            class_probs.append(rating)

    return top_value, class_probs

def cal_acc(class_probs, labels, top_k):
    top1 = 0.0
    top3 = 0.0
    
    for i, l in enumerate(labels):
        class_prob = class_probs[i]

        top_values = get_top_k(class_prob, top_k)

        if top_values[0] == l:
            top1 += 1.0
        if np.isin(np.array([l]), top_values):
            top3 += 1.0

    print("top1 acc", top1/len(labels))
    print("top3 acc", top3/len(labels))
    return top1, top3

def evaluate_model1(rating_arr, df_label):
    top_k = 3

    # Label
    label_arr = []
    for index, row in df_label.iterrows():
        label_per_row = []
        label_per_row.append(row['top1_meals'])
        label_per_row.append(row['top2_meals'])
        label_per_row.append(row['top3_meals'])

        label_per_row = [int(i) for i in label_per_row if str(i) != 'nan']
        label_arr.append(label_per_row)


    # Predicted
    top1_arr = []
    top3_arr = []
    for index, rating in enumerate(rating_arr): # For each user's demand
        print('pred: ', rating)
        print('label: ', label_arr[index])
        if not bool(rating):
            top1, top3 = 0, 0
            print("top1 acc", top1)
            print("top3 acc", top3)
        else:
            top_value, class_probs = prepare_class_probs(rating, top_k, len(label_arr[index]))

            top1, top3 = cal_acc(class_probs, label_arr[index], top_k)
        
        top1_arr.append(top1)
        top3_arr.append(top3)

        print('-------------------END 1 ROW------------------')
    print(len(top1_arr), len(top3_arr))
    print('Accuracy of TOP 1 is: ', sum(i for i in top1_arr) / len(top1_arr))
    print('Accuracy of TOP 3 is: ', sum(i for i in top3_arr) / len(top3_arr))


def get_meal_infor(dir_path):
    '''
    Get all meals and the corresponding average scores

    :param dir_path: folder path to meal information
    :return: 3 array meal_id, meal_menu, meal_score
    '''

    meal_menu = []
    meal_id = []
    meal_score = []
    with open(dir_path + 'meal_information.csv', encoding='utf-8') as mealFile:
        lines = csv.reader(mealFile)
        for line in lines:
            menu = line[2].split(',')
            id = line[0]
            score = line[4]
            if id != 'meal_id':
                # print(line)
                meal_menu.append(menu)
                meal_id.append(int(id))
                meal_score.append(float(score))
    
    return meal_id, meal_menu, meal_score

def pred_meal_baseline(input_meal_arr, file_path):
    '''
    Find all possible meal_id and following score

    :param input_meal_arr: Array of meal_id found - [meal_id_found, ...]
    :param file_path: Path to CSV file to extract corresponding meal_id, meal_score
    :return:  Array of dict - [{meal_id: meal_score}, {}]
    '''

    meal_id, _, meal_score = get_meal_infor(file_path)

    rating_arr = []
    for meal_id_found in input_meal_arr:
        meal_score_found = [meal_score[meal_id.index(i)] for i in meal_id_found ]
        rating_arr.append(dict(zip(meal_id_found, meal_score_found)))

    return rating_arr

def main():
    file_path = '../../dataset/csv_file/food/'

    df, df_label = load_data(file_path)
    input_meal_arr = find_meal(df)

    # Evaluate model
    print('---------------------Results of deep learning model----------------')
    df = meals.integerize_hobbies(dataframe=df)
    rating_model = pred_meal(df, input_meal_arr)
    evaluate_model1(rating_model, df_label)

    # Evaluate baseline
    # print('---------------------Results of baseline model----------------')
    # rating_baseline = pred_meal_baseline(input_meal_arr, file_path)
    # evaluate_model1(rating_baseline, df_label)

if __name__ == '__main__':
    main()

