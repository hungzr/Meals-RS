'''
    using fastText to classify and recommend
    Input: single meal, or sentence related to health, kind of meal, timestamp,...
    Output: the correspone menu
'''

import os
import fasttext
import time
from pymongo import MongoClient
import numpy as np

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['menu_list']
collection = db['list_menu']

def find_menu(input_txt):
    temp_arr = []
    for list in collection.find():
        title = list['title']
        for menu in list['menu']:
            temp_arr.append(menu['name'].lower().strip())
        if input_txt in temp_arr:
            return title, temp_arr
            break
        else:
            temp_arr = []
            title = ''

    return title, temp_arr

def train_model(train_dir_path, file_name_txt, saved_path):
    file_path = os.path.join(train_dir_path, file_name_txt)

    file_name_bin = file_name_txt.rsplit('_',2)[1]
    file_name_bin = 'model_' + file_name_bin.replace('.txt', '.bin')
    print(file_name_bin)

    model = fasttext.train_unsupervised(file_path, minCount = 1, dim= 25)
    model.save_model(os.path.join(saved_path, file_name_bin))

def load_model_category(dir_path):
    model_category = fasttext.load_model(os.path.join(dir_path, 'label_model_training.bin'))
    return model_category

def classify_meal(input_sentence, model_category):
    result = model_category.predict(input_sentence, k=2)
    # print(result[0])
    return result[0]

def recommendation(model_dir_path, category, input_txt):
    category_label_arr = [('__label__com', 'model_com.bin'), ('__label__khaivi', 'model_khaivi.bin'), ('__label__chay', 'model_chay.bin'),
                          ('__label__man', 'model_man.bin'), ('__label__canh', 'model_canh.bin'), ('__label__trangmieng', 'model_trangmieng.bin'),
                          ('__label__khac', 'model_khac.bin')]

    model_name = next(model for (label, model) in category_label_arr if label == category)
    # print(model_name)
    # Load the corresponding model and find nearest neighbor recipe
    # model = fasttext.load_model(os.path.join(model_dir_path, model_name))
    model = fasttext.load_model('/media/hungdo/DATA/AI/Final_Project/bin_file/vn2v.bin')
    final_result = model.get_nearest_neighbors(input_txt.replace(' ', '_'), k=2)
    final_result = [result[1].replace('_', ' ') for result in final_result]
    return final_result

def main_ver1(input_txt):
    model_dir_path = '/home/ti1070/HungDo/Other_Project/Final-Project/dataset/bin_file/'
    # model_dir_path = '/media/hungdo/DATA/AI/Final_Project/bin_file/'
    #
    # # Train model
    # train_dir_path = '../../dataset/txt_file/txt_recipe/'
    # for file_name_txt in os.listdir(train_dir_path):
    #     print('file:', file_name_txt)
    #     train_model(train_dir_path, file_name_txt, model_dir_path)
    #     print('-------Done for 1 recipe file------')

    # Load model_category to classify meal

    model_category = load_model_category(model_dir_path)

    # Recommendation
    title_result, menu_result = find_menu(input_txt)

    category = ''; recipe_result = ''
    if menu_result==[]:
        category = classify_meal(input_txt, model_category)
        # print('Nhóm được phân loại: ',category)
        category = category[0]
        recipe_result = recommendation(model_dir_path,category, input_txt)
        # print('Món ăn có sự tương đồng:', recipe_result)
        title_result, menu_result = find_menu(recipe_result)

        # Replace recipe_result by input_txt in menu_result
        menu_result = np.array(menu_result)
        menu_result = np.where(menu_result == recipe_result, input_txt.lower(), menu_result)

    string_menu = ', '.join(i for i in menu_result)

    print('Tìm thấy thực đơn: {0}; bao gồm các món: {1}'.format(title_result, string_menu))
    return category, recipe_result, title_result, string_menu


if __name__ == '__main__':
    tic = time.time()
    # main_ver1('cháo')
    a = recommendation('', '__label__khac', 'đậu sốt')
    print(a)
    toc = time.time()
    print('Thời gian tìm kiếm: ', toc-tic)
