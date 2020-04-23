

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

import csv
import pandas as pd

from more_itertools import unique_everseen
dir_path = '/media/hungdo/SYSTEM/Users/HungDo/Documents/GitHub/FinalProject_RecommendationSys/dataset/csv_file/food/'
with open(dir_path + 'test.csv','r') as f, open(dir_path + 'user_information.csv','w') as out_file:
    out_file.writelines(unique_everseen(f))