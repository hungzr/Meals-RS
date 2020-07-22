

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
import sys
import tempfile
import zipfile

# pylint: disable=g-bad-import-order
import numpy as np
import csv
import pandas as pd
import six
from six.moves import urllib  # pylint: disable=redefined-builtin
from absl import app as absl_app
from absl import flags
from absl import logging
import tensorflow as tf
# pylint: enable=g-bad-import-order

FOOD = "food"
DATASETS = [FOOD]

USERS_FILE = "user_information_re.csv"
RECIPES_FILE = "recipe_information.csv"
MEALS_FILE = "meal_information.csv"

USER_COLUMN = "user_id"
GENDER_COLUMN = "user_gender"
AGE_COLUMN = "user_age"
HOBBIES_COLUMN = "user_hobbies"
HEALTH_COLUMN = "user_health"
ITEM_COLUMN = "recipe_id"
ITEM_NAME_COLUMN = "recipe_name"
RATING_COLUMN = 'rating'

TOP0_COLUMN = "meals"

HOBBIES = [
    'gà', 'bò', 'lợn', 'cá', 'tôm',
    'rau', 'củ', 'quả', 'bánh mì', 'mì', 'cháo',
    'súp', 'xôi', 'lẩu', 'vịt', 'bún', 'phở'
]
N_HOBBY = len(HOBBIES)

AGES = [
    'trẻ em', 'người lớn', 'người già'
]
N_AGE = len(AGES)

HEALTHS = [
    'phụ nữ mang thai','bệnh tiểu đường', 'bệnh tim mạch',
    'bệnh huyết áp cao', 'bệnh dạ dày'
]
N_HEALTH = len(HEALTHS)

USER_COLUMNS = [USER_COLUMN, ITEM_COLUMN, GENDER_COLUMN, AGE_COLUMN, HOBBIES_COLUMN, HEALTH_COLUMN]
ITEM_COLUMNS = [ITEM_COLUMN, ITEM_NAME_COLUMN]

# Note: Users are indexed [1, k], not [0, k-1]
NUM_USER_IDS = 1000

#988
NUM_MEALS_MENU = 988
NUM_ITEM_IDS = 3354

MAX_RATING = 5


def csv_to_joint_dataframe(data_dir, dataset):
  users = pd.read_csv(os.path.join(data_dir, dataset, USERS_FILE))
  recipes = pd.read_csv(os.path.join(data_dir, dataset, RECIPES_FILE))

  df = users.merge(recipes, on=ITEM_NAME_COLUMN)
  df[RATING_COLUMN] = df[RATING_COLUMN].astype(np.float32)

  return df

def integerize_hobbies(dataframe):
  """Replace h string with a binary vector.

  Args:
    dataframe: a pandas dataframe of meal data.

  Returns:
    The transformed dataframe.
  """
  def _map_fn(entry):
    try:
        user_hoobies = entry.split("|")
        # print('user_hobbies: ', user_hoobies)
        output = np.zeros((len(HOBBIES),), dtype=np.int64)
        for i, hobby in enumerate(HOBBIES):
          if hobby in user_hoobies:
            output[i] = 1

    except:
        output = np.zeros((len(HOBBIES),), dtype=np.int64)

    return output

  dataframe[HOBBIES_COLUMN] = dataframe[HOBBIES_COLUMN].apply(_map_fn)
  # print('frame: ', dataframe[HOBBIES_COLUMN])

  return dataframe

def integerize_ages(dataframe):
  def _map_fn(entry):
    try:
        user_ages = entry
        # print('user_ages: ', user_ages)
        output = np.zeros((len(AGES),), dtype=np.int64)
        for i, age in enumerate(AGES):
          if age in user_ages:
            output[i] = 1

    except:
        output = np.zeros((len(AGES),), dtype=np.int64)

    return output

  dataframe[AGE_COLUMN] = dataframe[AGE_COLUMN].apply(_map_fn)
  # print('frame: ', dataframe[AGE_COLUMN])

  return dataframe

def integerize_healths(dataframe):
  def _map_fn(entry):
    try:
        user_healths = entry
        # print('user_healths: ', user_healths)
        output = np.zeros((len(HEALTHS),), dtype=np.int64)
        for i, health in enumerate(HEALTHS):
          if health in user_healths:
            output[i] = 1

    except:
        output = np.zeros((len(HEALTHS),), dtype=np.int64)

    return output

  dataframe[HEALTH_COLUMN] = dataframe[HEALTH_COLUMN].apply(_map_fn)
  # print('frame: ', dataframe[HEALTH_COLUMN])

  return dataframe
