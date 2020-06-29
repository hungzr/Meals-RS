from pymongo import MongoClient
import csv

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['user']
collection = db['user_info']

def get_history(user_id):
    user_history = []
    with open('../dataset/csv_file/food/user_information_re.csv', encoding='utf-8') as f:
        lines = csv.reader(f)
        for line in lines:
            if user_id == line[0]:
                user_history.append({'meal_id': line[7],
                                     'score': line[8]})
    
    return user_history

def insert_info():
    dir_path = '../dataset/csv_file/food/user_information.csv'
    with open(dir_path, encoding='utf-8') as mealFile:
        lines = csv.reader(mealFile)
        for line in lines:
            user_id = line[0]
            user_account = 'user' + user_id
            user_password = '1'
            user_name = user_account
            user_gender = line[1]
            user_age = line[2]
            user_hobbies = line[3]
            user_hobbies = user_hobbies.split('|')
            user_group = [line[4]]
            user_history = get_history(user_id)
             

            if user_id != 'user_id':
                dic = {'user_account': user_account, 'user_password': user_password, 'user_id': user_id, 
                        'user_name': user_name, 'user_gender': user_gender, 'user_age': user_age, 
                        'user_hobbies': user_hobbies,'user_group': user_group, 'user_history': user_history}

                x = collection.insert_one(dic)
                
                print(dic)
                print('----------------------------------------')
            
insert_info()