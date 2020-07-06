"""Prepare meals dataset for wide-deep."""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import functools
import os
# pylint: disable=wrong-import-order
from absl import app as absl_app
from absl import flags
import numpy as np
import tensorflow as tf
from fse.models import base_s2v
# pylint: enable=wrong-import-order

import meals
from utils.data import file_io
from utils.flags import core as flags_core


_BUFFER_SUBDIR = "wide_deep_buffer"
_FEATURE_MAP = {
    meals.USER_COLUMN: tf.compat.v1.FixedLenFeature([1], dtype=tf.int64),
    meals.GENDER_COLUMN: tf.compat.v1.FixedLenFeature([1], dtype=tf.int64),
    meals.AGE_COLUMN: tf.compat.v1.FixedLenFeature([meals.N_AGE], dtype=tf.int64),
    meals.HOBBIES_COLUMN: tf.compat.v1.FixedLenFeature([meals.N_HOBBY], dtype=tf.int64),
    meals.HEALTH_COLUMN: tf.compat.v1.FixedLenFeature([meals.N_HEALTH], dtype=tf.int64),
    meals.ITEM_COLUMN: tf.compat.v1.FixedLenFeature([1], dtype=tf.int64),
    meals.MENU: tf.compat.v1.FixedLenFeature([1], dtype=tf.int64),
    meals.RATING_COLUMN: tf.compat.v1.FixedLenFeature([1], dtype=tf.float32),
}

def build_name2id(arrA):
    start = 0
    name2id= {}
    result = []
    # print('old_len: ', len(arrA))
    for ele in arrA:
        # print('ele: ', ele)
        if type(ele) == type([]):
            re=[]
            for e in ele:
                if (e in name2id) == False:
                    name2id[e] = start
                    start += 1
                re.append(name2id[e])
            result.append(re)

        elif (ele in name2id) == False:
            name2id[ele] = start
            start += 1
            result.append(name2id[ele])
        else:
            result.append(name2id[ele])
    return name2id, result

def toNumber(dictA):
    for k, v in dictA.items():
        arrvalue = dictA[k]
        dictID, newarrvalue = build_name2id(arrvalue)
        dictA[k] = newarrvalue
    return dictA

_BUFFER_SIZE = {
    # don't make sure about this number
    meals.FOOD: {"train": 132561, "eval": 162811}
}

_USER_EMBEDDING_DIM = 16
_ITEM_EMBEDDING_DIM = 64
_MEALS_EMBEDDING_DIM = 16

def build_model_columns(dataset):
    """Builds a set of wide and deep feature columns."""
    # model_sen2vec = base_s2v.BaseSentence2VecModel.load('sent2vec')
    
    user_id = tf.feature_column.categorical_column_with_vocabulary_list(
              meals.USER_COLUMN, range(meals.NUM_USER_IDS))
    user_embedding = tf.feature_column.embedding_column(
              user_id, _USER_EMBEDDING_DIM, max_norm=np.sqrt(_USER_EMBEDDING_DIM))

    user_gender = tf.feature_column.numeric_column(meals.GENDER_COLUMN, dtype=tf.int64)

    user_age = tf.feature_column.numeric_column(
              meals.AGE_COLUMN, shape=(meals.N_AGE,), dtype=tf.int64)

    user_hobbies = tf.feature_column.numeric_column(
              meals.HOBBIES_COLUMN, shape=(meals.N_HOBBY,), dtype=tf.int64)

    user_health = tf.feature_column.numeric_column(
              meals.HEALTH_COLUMN, shape=(meals.N_HEALTH,), dtype=tf.int64)


    item_id = tf.feature_column.categorical_column_with_vocabulary_list(
              meals.ITEM_COLUMN, range(meals.NUM_ITEM_IDS))
    item_embedding = tf.feature_column.embedding_column(
              item_id, _ITEM_EMBEDDING_DIM, max_norm=np.sqrt(_ITEM_EMBEDDING_DIM))

    meals_id = tf.feature_column.categorical_column_with_vocabulary_list(
              meals.MENU, meals.MEALS_MENU)
    meals_embedding = tf.feature_column.embedding_column(
              meals_id, _MEALS_EMBEDDING_DIM, max_norm=np.sqrt(_MEALS_EMBEDDING_DIM))

    deep_columns = [user_embedding, item_embedding, user_gender, user_hobbies, user_health]
    wide_columns = [user_age, meals_embedding]

    return wide_columns, deep_columns


def _deserialize(examples_serialized):
    print('example: ', examples_serialized)
    features = tf.parse_example(examples_serialized, _FEATURE_MAP)
    classes = features[meals.RATING_COLUMN]/meals.MAX_RATING
    # classes = tf.equal(classes)
    return features, classes


def _buffer_path(data_dir, dataset, name):
    return os.path.join(data_dir, _BUFFER_SUBDIR,
                      "{}_{}_buffer".format(dataset, name))


def _df_to_input_fn(df, name, dataset, data_dir, batch_size, repeat, shuffle):
    """Serialize a dataframe and write it to a buffer file."""
    buffer_path = _buffer_path(data_dir, dataset, name)
    expected_size = _BUFFER_SIZE[dataset].get(name)
  
    file_io.write_to_buffer(
        dataframe=df, buffer_path=buffer_path,
        columns=list(_FEATURE_MAP.keys()), expected_size=expected_size)

    def input_fn():
      dataset = tf.data.TFRecordDataset(buffer_path)
      # batch comes before map because map can deserialize multiple examples.
      dataset = dataset.batch(batch_size)
      print('dataset: ', dataset)
      dataset = dataset.map(_deserialize, num_parallel_calls=16)
      if shuffle:
          dataset = dataset.shuffle(shuffle)

      dataset = dataset.repeat(repeat)
      return dataset.prefetch(1)

    return input_fn


def _check_buffers(data_dir, dataset):
    train_path = os.path.join(data_dir, _BUFFER_SUBDIR,
                              "{}_{}_buffer".format(dataset, "train"))
    eval_path = os.path.join(data_dir, _BUFFER_SUBDIR,
                            "{}_{}_buffer".format(dataset, "eval"))

    if not tf.gfile.Exists(train_path) or not tf.gfile.Exists(eval_path):
      return False

    return all([
        tf.gfile.Stat(_buffer_path(data_dir, dataset, "train")).length ==
        _BUFFER_SIZE[dataset]["train"],
        tf.gfile.Stat(_buffer_path(data_dir, dataset, "eval")).length ==
        _BUFFER_SIZE[dataset]["eval"],
    ])


def construct_input_fns(dataset, data_dir, batch_size=16, repeat=1):
    """Construct train and test input functions, as well as the column fn."""
    if _check_buffers(data_dir, dataset):
      train_df, eval_df = None, None
    else:
      df = meals.csv_to_joint_dataframe(dataset=dataset, data_dir=data_dir)
      df = meals.integerize_hobbies(dataframe=df)
      df = meals.integerize_ages(dataframe=df)
      df = meals.integerize_healths(dataframe=df)

      df = df.drop(columns=[meals.ITEM_NAME_COLUMN])
      df = df.drop(columns=["actual_id"])
      df = df.drop(columns=["ingredients"])
      df = df.drop(columns=["methods"])
      df = df.drop(columns=["image"])
      df = df.drop(columns=["average_rating"])
      print('df: ', df)

      train_df = df.sample(frac=0.8, random_state=0)
      eval_df = df.drop(train_df.index)

      train_df = train_df.reset_index(drop=True)
      eval_df = eval_df.reset_index(drop=True)

    train_input_fn = _df_to_input_fn(
        df=train_df, name="train", dataset=dataset, data_dir=data_dir,
        batch_size=batch_size, repeat=repeat,
        shuffle=None)
    eval_input_fn = _df_to_input_fn(
        df=eval_df, name="eval", dataset=dataset, data_dir=data_dir,
        batch_size=batch_size, repeat=repeat, shuffle=None)
    model_column_fn = functools.partial(build_model_columns, dataset=dataset)

    train_input_fn()
    return train_input_fn, eval_input_fn, model_column_fn


def main(_):
    # meals.download(dataset=flags.FLAGS.dataset, data_dir=flags.FLAGS.data_dir)
    # dir_path = "../../../dataset/csv_file/"
    dir_path = "/home/hungdo/HungDo/Meals-RS/dataset/csv_file/"
    construct_input_fns("food", dir_path)

if __name__ == "__main__":
    # tf.logging.set_verbosity(tf.logging.INFO)
    # meals.define_data_download_flags()
    flags.adopt_module_key_flags(meals)
    # flags_core.set_defaults(dataset="food")
    absl_app.run(main)
