from pymongo import MongoClient
import csv

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['user']
collection = db['user_info']
collection_hobbies = db['recipe_groups']
collection_group = db['user_group']

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

def insert_hobbies():
    hobbies = ['gà', 'bò', 'lợn', 'cá', 'tôm',
           'rau', 'củ', 'quả', 'bánh mì', 'mì', 'cháo',
           'súp', 'xôi', 'lẩu', 'vịt', 'bún', 'phở']
    for i in hobbies:
        dic = {'recipe_group':i}

        x = collection_hobbies.insert_one(dic)
                
        print(dic)
        print('----------------------------------------')
    return

def insert_health():
    health_arr = [
        ('bệnh tim mạch', ['Nước ngọt','Cà Phê','Thịt lợn','Thịt trâu','Thịt đà điểu','Bánh quẩy']),
        ('bệnh huyết áp cao', ['Ớt', 'Thịt gà ', 'Bia', 'Rượu', 'Cà phê', 'Trà đặc']),
        ('phụ nữ mang thai', ['Ngải cứu', 'Cam thảo', 'Cá ngừ xanh', 'Đu đủ xanh', 'Bia', 'Rượu', 'Nem chua']),
        ('bệnh tiểu đường', ['Bánh ngọt', 'Nước ngọt', 'Cà phê ', 'Bia', 'Rượu' ,'Mì tôm']),
        ('bệnh dạ dày', ['Khế xanh', 'Cà phê ', 'Bia', 'Hạt tiêu', 'Ớt'])
    ]

    for health in health_arr:
        dic = {'group_name': health[0], 'diet_food': [i.lower() for i in health[1]]}

        x = collection_group.insert_one(dic)
                
        print(dic)
        print('----------------------------------------')

# insert_info()
# insert_hobbies()
insert_health()