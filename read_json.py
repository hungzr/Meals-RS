

# from collections import defaultdict
# d = defaultdict(list)
# input = [('a', 1), ('b', 1), ('c', 1), ('d', 1), ('c', 1), ('b', 1), ('a', 1), ('a', 1), ('c', 1), ('c', 1)]
# for key, value in input:
#     d[key].append(value)
# print(d.items())
#
# result= []
# for key, value in d.items():
#     total = sum(value)
#     temp = (key, total)
#     result.append(temp)
# print(result)

# import numpy as np
# A = ['a','b a','c','d']
# B = ['b','d']
# print(np.in1d(A,B))

# import matplotlib.pyplot as plt
# loss = [5,4.75,2.766,2,1.35,0.5]
# mean = [0.4, 1.6, 1.8, 2.4, 2.89, 4.5]
#
#
# # plt.figure()
# line1 = plt.plot(loss, label='Loss average')
# plt.setp(line1, linewidth = 2)
# plt.title('test loss')
# plt.xlabel('epochs')
# plt.ylabel('loss')
# plt.savefig('./foo1.png')
# # plt.show()
#
# plt.clf()
# line2 = plt.plot(mean, label='Mean')
# plt.setp(line2, linewidth= 1)
# plt.title('test label')
# plt.xlabel('epochs1')
# plt.ylabel('loss1')
# # plt.legend(loc='upper right')
# plt.savefig('./foo2.png')
# plt.show()

# import csv
# import pandas as pd

# from more_itertools import unique_everseen
# dir_path = '/media/hungdo/SYSTEM/Users/HungDo/Documents/GitHub/FinalProject_RecommendationSys/dataset/csv_file/food/'
# with open(dir_path + 'test.csv','r') as f, open(dir_path + 'user_information.csv','w') as out_file:
#     out_file.writelines(unique_everseen(f))

import csv
import random
from pymongo import MongoClient

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['News']


save_file = open('./dataset/txt_file/label_check_unrelated.txt', 'w+', encoding="utf8")
# For recipes
with open('./dataset/csv_file/recipes_demo01.csv','r') as csv_file:
    lines = csv.reader(csv_file)
    for line in lines:
        if line[0] != 'mon_an':
            result = '__label__recipe ' + line[0]
            # print(result)
            save_file.writelines(result + '\n')

# For other inputs
DIGITS = "0123456789"
LETTERS_UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
LETTERS_LOWER = "abcdefghijklmnopqrstuvwxyz"
CHARS = DIGITS + LETTERS_UPPER + LETTERS_LOWER

max_num_1 = 300
count = 0
for i in range(max_num_1):
    if count < 60:
        random_k = random.randrange(1,5)
    elif count < 120:
        random_k = random.randrange(5,10)
    elif count < 180:
        random_k = random.randrange(10,15)
    elif count < 240:
        random_k = random.randrange(15,20)
    else:
        random_k = random.randrange(20,25)

    result = random.choices(CHARS, k=random_k)
    result = ''.join(i for i in result)
    result = '__label__other ' + result
    count += 1
    # print(result)

    save_file.writelines(result + '\n')

def get_result_db(db_name):

    collection = db[db_name]
    count = 0
    for detail in collection.find():
        if count > 450: break
        result = detail['title'].replace('\"','')
        result = '__label__other ' + result
        count += 1
        print(result)

        save_file.writelines(result + '\n')

db_arr = ['vnexpress_dinhduong', 'vnexpress_thucdon', 'vietnamnet', 'khoahocdoisong']
for db_name in db_arr:
    get_result_db(db_name)