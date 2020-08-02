import csv
import random
import os
from pymongo import MongoClient
import fasttext

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['News']


def prepare_classify_training():
    save_file = open('../dataset/txt_file/train_check_unrelated.txt', 'w+', encoding="utf8")
    # For recipes
    with open('../dataset/csv_file/recipes_demo01.csv','r') as csv_file:
        lines = csv.reader(csv_file)
        for line in lines:
            if line[0] != 'mon_an':
                result = '__label__recipe ' + line[0].replace('\n',' ')
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

def training_classify(bin_path):
    model = fasttext.train_supervised(input="../dataset/txt_file/train_check_unrelated.txt",
                                    epoch=35, lr=0.5)
    model.save_model(os.path.join(bin_path,"label_check_input.bin"))
    # a = model.test("")
    # print(a)

def testing_classify(bin_path, input_recipe):
    model = fasttext.load_model(os.path.join(bin_path, 'label_check_input.bin'))
    a = model.test("../dataset/txt_file/test_check_unrelated.txt", k=5)
    print(a)

    result = model.predict(input_recipe)
    print(result[0][0])

def main():
    bin_path = "/media/hungdo/DATA/AI/Final_Project/bin_file"
    # prepare_classify_training()

    # training_classify(bin_path)
    input_recipe = "Đau nhức cột sống cổ, đau lan vai và tay "
    testing_classify(bin_path, input_recipe)

if __name__ == "__main__":
    main()