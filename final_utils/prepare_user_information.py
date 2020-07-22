import csv
import random
import pandas as pd

# User information
demand = []
dir_path = '../dataset/csv_file/food/'
with open(dir_path + 'recipe_information.csv', encoding = 'utf-8') as recipesFile:
    lines = csv.reader(recipesFile)
    for line in lines:
        line = line[1]
        # print('line:', line)
        demand.append(line)
# Nam - 0
gender = [0, 1]
age_group = ['trẻ em', 'người lớn', 'người già']
hobbies = ['gà', 'bò', 'lợn', 'cá', 'tôm',
           'rau', 'củ', 'quả', 'bánh mì', 'mì', 'cháo',
           'súp', 'xôi', 'lẩu', 'vịt', 'bún', 'phở']
health = ['bệnh tiểu đường', 'bệnh tim mạch',
          'bệnh huyết áp cao', 'bệnh dạ dày']

# Label for mapping
meals_label = []
meal_label_id = []
with open(dir_path + 'meal_information.csv', encoding= 'utf-8') as mealFile:
    lines = csv.reader(mealFile)
    for line in lines:
        menu = line[2].split(',')
        id = line[0]
        if menu != '' and menu != 'recipes':
            # print(line)
            meals_label.append(menu)
            meal_label_id.append(id)



#1000 random user information
def generate_normal_user(number_user = 1000):
    train_demand_arr = []; train_gender_arr = []; train_age_arr = []
    train_hobbies_arr = []; train_health_arr = []; train_id_arr = []; train_history_arr = []

    test_demand_arr = []; test_gender_arr = []; test_age_arr = []
    test_hobbies_arr = []; test_health_arr = []; test_id_arr = []; test_history_arr = []

    top0_arr = []; rating_arr = []
    top1_arr = []; top2_arr = []; top3_arr = []; top4_arr = []; top5_arr = []
    count = 1; count_female = 0
    count_label = 5

    for i in range(number_user):
        user_id = i
        user_gender = random.choice(gender)
        user_age = random.choice(age_group)

        if count < 50:
            user_hobbies = 'null'
        elif count < 300:
            user_hobbies = random.choices(hobbies, k=3)
        elif count < 750:
            user_hobbies = random.choices(hobbies, k=2)
        else:
            user_hobbies = random.choices(hobbies, k=1)

        str_user_hobbies = ''
        if user_hobbies != 'null':
            for i in user_hobbies:
                str_user_hobbies += i + '|'

            str_user_hobbies = str_user_hobbies[:-1]

        print('hobbies: ', str_user_hobbies)

        user_health = ''
        if ((count < 32) or (count > 250 and count < 300) or (count > 400 and count < 450) or (
                count > 750 and count < 850)) \
                and (user_age.strip() != 'trẻ em'):
            user_health = random.choice(health)
        if count_female < 50 and user_health == '' and user_gender == 1 and user_age == 'người lớn':
            count_female += 1
            user_health = 'phụ nữ mang thai'

        # Each user has 50 demands for training, 2 demands for testing
        for j in range(70):
            user_demand = random.choice(demand)
            print('demand: ', user_demand)

            # Mapping
            meal_arr = [];
            temp = 0
            for index, meals in enumerate(meals_label):
                if temp == count_label: break
                for meal in meals:
                    if user_demand in meals and any(check in meal for check in user_hobbies):
                        print('meal_hobbies: ', meals)
                        print('index: ', meal_label_id[index])
                        meal_arr.append(meal_label_id[index])
                        temp += 1
                        break

            current = count_label - temp
            print('current: ', current)

            for i in range(current):
                check = False
                # print('i: ',i)
                for index, meals in enumerate(meals_label):
                    if user_demand in meals and meal_label_id[index] not in meal_arr:
                        print('meals: ', meals)
                        print('index: ', meal_label_id[index])
                        meal_arr.append(meal_label_id[index])
                        check = True
                        break
                if check == False:
                    meal_arr.append('')


            # For testing
            if j < 20:
                test_id_arr.append(user_id)
                test_demand_arr.append(user_demand)
                test_gender_arr.append(user_gender)
                test_age_arr.append(user_age)
                test_hobbies_arr.append(str_user_hobbies)
                test_health_arr.append(user_health)
                test_history_arr.append([])


                top1_arr.append(meal_arr[0])
                top2_arr.append(meal_arr[1])
                top3_arr.append(meal_arr[2])
                top4_arr.append(meal_arr[3])
                top5_arr.append(meal_arr[4])

            # For training
            else:
                meal_arr = [i for i in meal_arr if i != '']
                print('new_meal_arr: ', meal_arr)

                for index, menu in enumerate(meal_arr):
                    train_id_arr.append(user_id)
                    train_demand_arr.append(user_demand)
                    train_gender_arr.append(user_gender)
                    train_age_arr.append(user_age)
                    train_hobbies_arr.append(str_user_hobbies)
                    train_health_arr.append(user_health)
                    train_history_arr.append([])

                    top0_arr.append(menu)
                    rating_arr.append(5 - index)

                # try: #In case meal_arr exist
                #     temp = random.choice(meal_arr)
                #     top0_arr.append(temp)
                #
                #     rating = meal_arr.index(temp)
                #     rating_arr.append(5 - rating)
                # except: #In case meal_arr == []
                #     top0_arr.append(0)
                #     rating_arr.append(0)
            print('----------------------------------END 1 DEMAND----------------------------------')

        count += 1
        print('number_user: ', count)
        print('-------------------------')


    # Regressor CSV
    user_information_re = {'user_id': train_id_arr, 'recipe_name': train_demand_arr, 'user_gender': train_gender_arr,
                           'user_age': train_age_arr, 'user_hobbies': train_hobbies_arr, 'user_health': train_health_arr,
                           'user_history': train_history_arr, 'meals': top0_arr, 'rating': rating_arr}

    # Classify CSV
    user_information_class = {'user_id': test_id_arr, 'recipe_name': test_demand_arr, 'user_gender': test_gender_arr,
                              'user_age': test_age_arr, 'user_hobbies': test_hobbies_arr, 'user_health': test_health_arr,
                              'top1_meals': top1_arr, 'top2_meals': top2_arr, 'top3_meals': top3_arr,
                              'top4_meals': top4_arr, 'top5_meals': top5_arr}


    print(user_information_class)
    return user_information_re, user_information_class


def convert_to_csv(user_information_re, user_information_class):
    df_re = pd.DataFrame(user_information_re,
                         columns=['user_id','recipe_name', 'user_gender', 'user_age', 'user_hobbies', 'user_health',
                                                 'user_history','meals', 'rating'])

    df_class = pd.DataFrame(user_information_class,
                      columns=['user_id', 'recipe_name', 'user_gender', 'user_age', 'user_hobbies', 'user_health',
                                'top1_meals', 'top2_meals', 'top3_meals', 'top4_meals', 'top5_meals'])

    dir_path = "../dataset/csv_file/food/"

    export = df_re.to_csv(dir_path +  "user_information_re.csv", index=None , encoding="utf8")
    export1 = df_class.to_csv(dir_path + "user_information_class.csv", index=None, encoding="utf8")

def main():
    user_information_re, user_information_class = generate_normal_user()
    convert_to_csv(user_information_re, user_information_class)

if __name__ == '__main__':
    main()


