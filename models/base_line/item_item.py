"""Input: single 'món ăn'
   Output: the related 'mâm cơm'
   Method : search by keywords"""

import csv
from models.tokenization.dict_models import LongMatchingTokenizer

def sententce_process(string):
    lm_tokenizer = LongMatchingTokenizer()
    tokens = lm_tokenizer.tokenize(string)
    return  tokens
    # print(tokens)

def findMam(item):
    with open("C:/Users/HungDo/Documents/GitHub/News/Beautiful Soup/utils/items_demo.csv", 'r', encoding="utf8") as csvfile:
        reader = csv.DictReader(csvfile)

        result_arr = []
        for row in reader:
            recipes = row['recipes']
            if item.strip() in recipes:
                title = row['title']

                temp = [title, recipes]
                result_arr.append(temp)
                # print('Gợi ý:',title, ' với menu: ', recipes)
        # print(result_arr)
    return result_arr
    csvfile.close()

def main():
    sententce = 'học sinh chiên '
    result = findMam(sententce)

    splits = sententce_process(sententce.strip())
    print(splits)
    count = 0
    while result == [] and count < len(splits):
        new_sentence = splits[count].replace('_',' ')
        print(new_sentence)
        result = findMam(new_sentence)
        count+=1

    print(result)

main()
