import pandas as pd
from pymongo import MongoClient
import csv
import os


# client = MongoClient('mongodb://localhost:27017')
client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['menu_list']

def get_recipes(db_name):

    collection = db[db_name]
    mon_01 = []; mon_02 = []; mon_03 = []
    mon_04 = []; mon_05 = []; mon_06= []; mon_07 = []

    result_arr = []
    number_of_recipe = 6

    recipe_arr = [];
    ingredients_arr = [];
    id_arr = []
    count = 0

    for list in collection.find():
        menu = list['menu']

        # Get all recipe_name in each menu
        for recipes in menu:
            recipe_id = count
            id_arr.append(recipe_id)
            count += 1

            recipe_name = recipes['name'].replace('\n', ' ')
            print('name: ', recipe_name)
            recipe_arr.append(recipe_name)

            ingredient_arr = []
            # ingredients = recipes['ingredients']
            # for i in ingredients:
            #     try:
            #         ingredient = i['ingredientLine']
            #         print(ingredient)
            #     except:
            #         ingredient = ''
            #     ingredient_arr.append(ingredient)
            ingredients_arr.append(ingredient_arr)
            print('------------------')


    #     # Check if the length of result_arr is equal to
    #     # number_of_recipe - default index for preparing dump into CSV column
    #     length_results = len(arr)
    #     temp = number_of_recipe - length_results
    #     if temp != 0:
    #         for i in range(temp):
    #             arr.append('')
    #
    #     # Prepair data for each column
    #     result_arr.append(arr)
    #     # print(result_arr)
    #
    # for i in result_arr:
    #     mon_01.append(i[0])
    #     mon_02.append(i[1])
    #     mon_03.append(i[2])
    #     mon_04.append(i[3])
    #     mon_05.append(i[4])
    #     mon_06.append(i[5])
    #     # mon_07.append(i[6])
    #
    # final_result = {'mon_01': mon_01, 'mon_02': mon_02, 'mon_03': mon_03,
    #         'mon_04': mon_04, 'mon_05': mon_05, 'mon_06': mon_06}

    final_result = {'recipe_id': id_arr, 'recipe_name': recipe_arr}

    return final_result

def remove_duplicate(x):
    return list(dict.fromkeys(x))

def convert_to_csv(arr, file_name):
    recipes_col = {'mon_an': arr}
    df = pd.DataFrame(recipes_col, columns=['mon_an'])
    export = df.to_csv("./csv_file/recipe_csv/" + file_name + ".csv", index=None , encoding="utf8")
    print(export)

def convert_to_txt(arr, file_name):
    save = open("./txt_file/" + file_name + ".txt", 'w+', encoding="utf-8")
    for i in arr:
        save.write(i.replace(' ','_') + '\n')


def category(path_dir):
    result_canh = []; result_khaivi = []
    result_com = []; result_trangmieng = []
    result_chay = []; result_man = []
    result_khac = []

    with open(path_dir + 'csv_file/recipes_demo01.csv', encoding="utf8") as csvfile:
        lines = csv.reader(csvfile)
        for line in lines:
            # print(line[0])
            name = line[0].replace('"', '').replace('\n', '').replace('.', '').strip()

            # Cơm
            arr_com = ['cơm']
            #
            # Canh
            arr_canh = ['canh', 'xào', 'rau', 'om', 'luộc']
            #
            # Khai vị
            arr_khaivi = ['súp', 'nộm', 'trộn', 'salad']

            # Chay
            arr_chay = ['đậu', 'lạc', 'cuốn', 'cà']

            # Tráng miệng
            arr_trangmieng = ['hoa quả', 'bánh', 'chè', 'sinh tố', 'nước ép', 'trái cây']

            # Mặn
            arr_man = ['rán', 'chiên', 'hấp', 'hầm', 'quay', 'nướng', 'rang', 'thịt',
                       'ốc', 'lẩu', 'gà', 'bò', 'lợn', 'heo', 'đà điểu', 'mì', 'cá', 'tôm',
                       'bạch tuộc', 'lòng', 'gan']


            if any(check in name for check in arr_com):
                result_com.append(name)

            elif any(check in name for check in arr_man) \
                    and 'đậu' not in name and 'lạc' not in name and 'canh' not in name:
                # lạc rang, đậu rán, canh mướp nấu thịt, canh bí đỏ nấu gà
                result_man.append(name)

            elif any(check in name for check in arr_canh):
                result_canh.append(name)

            elif any(check in name for check in arr_khaivi):
                result_khaivi.append(name)

            elif any(check in name for check in arr_trangmieng):
                result_trangmieng.append(name)

            elif any(check in name for check in arr_chay):
                result_chay.append(name)

            else:
                result_khac.append(name)

    result_arr = [[result_com, 'recipe_com'], [result_man, 'recipe_man'], [result_chay, 'recipe_chay'],
                  [result_khac, 'recipe_khac'], [result_trangmieng, 'recipe_trangmieng'], [result_canh, 'recipe_canh'],
                  [result_khaivi, 'recipe_khaivi']]

    for i in result_arr:
        # convert_to_csv(i[0], i[1])
        convert_to_txt(i[0], i[1])

def prepair_label(dir_path):
    file_names = os.listdir(dir_path)
    save = open(os.path.join(dir_path, 'label_training.txt'), 'w+', encoding="utf8")

    for file_name in file_names:
        file_path = os.path.join(dir_path, file_name)
        label_name = file_name.replace('recipe_', '').replace('.csv', '')
        # print(file_name)

        with open(file_path, encoding="utf-8") as recipeFile:
            lines = csv.reader(recipeFile)
            for line in lines:
                if 'mon_an' not in line:
                    label = '__label__' + label_name + ' ' + line[0]
                    print(label)
                    save.writelines(label + '\n')


def main():
    db_arr = ['list_menu']
    final_results = []
    for i in db_arr:
        result = get_recipes(i)

    # df = pd.DataFrame(result, columns=['mon_01', 'mon_02', 'mon_03', 'mon_04', 'mon_05', 'mon_06'])
    df = pd.DataFrame(result, columns=['recipe_id', 'recipe_name'])
    export = df.to_csv("/media/hungdo/SYSTEM/Users/HungDo/Documents/GitHub/FinalProject_RecommendationSys/dataset/csv_file/food/recipe_information.csv", index=None, encoding="utf8")
    #
    # # Remove duplicate recipes
    # final_results = remove_duplicate(final_results)
    #
    # convert_to_csv(recipes_col)


    # path_dir = '/media/hungdo/SYSTEM/Users/HungDo/Documents/GitHub/FinalProject_RecommendationSys/utils/'
    # category(path_dir)
    # prepair_label(path_dir + 'csv_file/recipe_csv')


if __name__ == '__main__':
    main()
