"""This modul is written to generate Ratings and convert it into CSV"""
import json
import pandas as pd
import json
from bson import ObjectId
from pymongo import  MongoClient
from random import randrange

client = MongoClient('mongodb+srv://hungdo:Hung1598@newscluster-imhry.gcp.mongodb.net/test?retryWrites=true&w=majority')
db = client['menu_list']

class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId):
            return str(o)
        return json.JSONEncoder.default(self, o)

# Prepare data (each feature is saved by array)
def prepare_data():
    menu = db.mam_com

    # Item data
    actual_id = [];
    item_id = []
    title = [];
    recipes = []
    category = ''

    for i in menu.find():

        temp_id = i['_id']
        temp_id = JSONEncoder().encode(temp_id).replace('\"', '')
        actual_id.append(temp_id)

        item_id = [j for j in range(len(actual_id))]

        temp_title = i['title'].replace(':', '')
        title.append(temp_title)

        category = i['category']

        temp_recipes = []
        arr_recipes = i['menu']
        for recipe in arr_recipes:
            temp_name = recipe['name']
            temp_recipes.append(temp_name)
        recipes.append(temp_recipes)

    result_item = {'item_id': item_id, 'actual_id': actual_id, 'title': title, 'category': category, 'recipes': recipes}
    print(result_item)

    # Rating data
    user_id = []; ratings = []; items_id = []
    number_user = 10; number_rating = 6
    for i in range(len(item_id)*7):
        temp_id = randrange(1,number_user+1)
        user_id.append(int(temp_id))

        temp_index = randrange(len(item_id))
        items_id.append(item_id[temp_index])

        ratings.append(float(randrange(number_rating)))

    result_rating = {'user_id':user_id, 'item_id':items_id, 'rating': ratings}

    # print (result_rating)

    return result_item, result_rating

#Convert to CSV file
def convert_item_to_csv(dict):
    # Example dict's structure
    # long_dict ={
    #     "newsId":[
    #         "5cbf3c79a29e122e4c79a96d",
    #         "5cbf3c81a29e122e4c79a96e"
    #     ],
    #     "title":[
    #         "Mâm 1:",
    #         "Mâm 2:"
    #     ],
    #     "category": "365 Mâm cơm "
    # }
    #
    df = pd.DataFrame(dict, columns=['item_id', 'actual_id', 'title', 'category', 'recipes'])
    export = df.to_csv("items_demo.csv", index=None)
    print(export)

def convert_rating_to_csv(dict):
    df = pd.DataFrame(dict, columns=['user_id','item_id', 'rating'])
    export = df.to_csv("ratings_demo.csv", index=None)
    print(export)

item_dict, rating_dict = prepare_data()
convert_item_to_csv(item_dict)
convert_rating_to_csv(rating_dict)






