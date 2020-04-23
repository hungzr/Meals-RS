import tensorflow as tf
import numpy as np
import meals

# detection_graph = tf.Graph()
# with detection_graph.as_default():
#     od_graph_def = tf.GraphDef()
#     with tf.gfile.GFile('/home/ti1070/HungDo/FinalProject_RecommendationSys/models/deep_learning/tmp/1584804245/saved_model.pb', 'rb') as fid:
#         serialized_graph = fid.read()
#         od_graph_def.ParseFromString(serialized_graph)
#         tf.import_graph_def(od_graph_def, name='')
#
#     sess = tf.Session(graph=detection_graph)


def load_df(dataset, data_dir):
    df = meals.csv_to_joint_dataframe(dataset=dataset, data_dir=data_dir)
    df = meals.integerize_hobbies(dataframe=df)
    df = meals.integerize_ages(dataframe=df)
    df = meals.integerize_healths(dataframe=df)

    df = df.drop(columns=[meals.ITEM_NAME_COLUMN])
    print('df: ', df)

    return df

def evaluate_data(df):

    # Load saved_model
    model = tf.saved_model.load('/home/ti1070/HungDo/FinalProject_RecommendationSys/models/deep_learning/tmp/1585285420')

    # user_id = [0,1]
    # recipe_id = [621,102]
    # user_gender = [0,0]
    # user_age = [[0, 0, 1], [0, 1, 0]]
    # user_hobbies = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    #                 [0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]]
    # user_health = [[0, 1, 0, 0, 0],[0, 0, 1, 0, 0]]
    # user_history = [[],[]]
    # meals = [166, 310]

    # Prepare data columns
    user_id = []
    recipe_id = []
    user_gender = []
    user_age = []
    user_hobbies = []
    user_health = []
    user_history = []
    meals = []

    rating = []

    for index, row in df.iterrows():
        rating.append(row['rating'])
        # print('rating: ', rating)

        user_id.append(row['user_id'])
        recipe_id.append(row['recipe_id'])

        temp_gender = row['user_gender']
        user_gender.append(int(temp_gender))

        temp_age = row['user_age']
        user_age.append([int(i) for i in temp_age])

        temp_hobbies = row['user_hobbies']
        user_hobbies.append([int(i) for i in temp_hobbies])

        temp_health = row['user_health']
        user_health.append([int(i) for i in temp_health])

        user_history.append([])

        meals.append(row['meals'])

    #Predict test data
    for i in range(len(user_id)):
        example = tf.train.Example()

        example.features.feature["user_id"].int64_list.value.append(user_id[i])
        example.features.feature["recipe_id"].int64_list.value.append(recipe_id[i])
        example.features.feature["user_gender"].int64_list.value.append(user_gender[i])
        example.features.feature["user_age"].int64_list.value.extend(user_age[i])
        example.features.feature["user_hobbies"].int64_list.value.extend(user_hobbies[i])
        example.features.feature["user_health"].int64_list.value.extend(user_health[i])
        example.features.feature["user_history"].int64_list.value.extend(user_history[i])
        example.features.feature["meals"].int64_list.value.append(meals[i])

        print('ex: ',example)
        pred = model.signatures["predict"](examples=tf.constant([example.SerializeToString()]))


        # print('pred: ', pred)
        result = np.asarray(pred['predictions'])

        result = result.item()
        print('rating: ', rating[i])
        print('test{0}: {1}' .format(i, result))
        print('------------------------')

def main():
    dir_path = '/home/ti1070/HungDo/FinalProject_RecommendationSys/dataset/csv_file/'
    dataset = 'test'
    df = load_df(dataset,dir_path)
    evaluate_data(df)

main()
