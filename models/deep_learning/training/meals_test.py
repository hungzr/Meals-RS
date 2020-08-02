# Copyright 2017 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
# import sys
# sys.path.append('/media/hungdo/DATA/AI/models')
import unittest

import numpy as np
import tensorflow as tf  # pylint: disable=g-bad-import-order

from models.deep_learning import meals
from utils.misc import keras_utils
from utils.testing import integration
from models.deep_learning import meals_dataset
from models.deep_learning import meals_main

tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)


TEST_INPUT_VALUES = {
    "user_hobbies": np.array(
        [1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]),
    "user_id": [3],
    "recipe_id": [4],
}

TEST_RECIPE_DATA = """recipe_id
1,mon1
2,mon2
3,mon3
4,mon4
5,mon5
6,mon6
7,mon7"""

TEST_USER_DATA = """user_id,recipe_name,user_gender,user_age,user_hobbies,user_health,meals,rating
1,mon2,1,người lớn,phở|rau|cháo,,103,5
1,mon3,1,người lớn,phở|rau|cháo,,136,3
1,mon6,0,người lớn,phở|rau|cháo,,412,2
2,mon1,0,trẻ em,lợn|tôm|phở,,268,3
2,mon7,0,trẻ em,lợn|tôm|phở,,273,2
3,mon1,1,người già,vịt|lẩu|súp,bệnh tiểu đường,734,5
3,mon4,0,người già,vịt|lẩu|súp,bệnh tiểu đường,9,5
3,mon5,1,người già,vịt|lẩu|súp,bệnh tiểu đường,739,1
"""


class BaseTest(tf.test.TestCase):
  """Tests for Wide Deep model."""

  @classmethod
  def setUpClass(cls):  # pylint: disable=invalid-name
    super(BaseTest, cls).setUpClass()
    meals_main.define_meal_flags()

  def setUp(self):
    # Create temporary CSV file
    self.temp_dir = self.get_temp_dir()

    # dir_path = "/media/hungdo/SYSTEM/Users/HungDo/Documents/GitHub/FinalProject_RecommendationSys/dataset/csv_file/"
    # self.temp_dir = dir_path

    tf.io.gfile.makedirs(os.path.join(self.temp_dir, meals.FOOD))

    self.user_csv = os.path.join(
        self.temp_dir, meals.FOOD, meals.USERS_FILE)
    self.recipe_csv = os.path.join(
        self.temp_dir, meals.FOOD, meals.RECIPES_FILE)

    # Read CSV files
    with tf.io.gfile.GFile(self.recipe_csv, "w") as f:
      f.write(TEST_RECIPE_DATA)

    with tf.io.gfile.GFile(self.user_csv, "w") as f:
      f.write(TEST_USER_DATA)

  @unittest.skipIf(keras_utils.is_v2_0(), "TF 1.0 only test.")
  def test_input_fn(self):
    train_input_fn, _, _ = meals_dataset.construct_input_fns(
        dataset=meals.FOOD, data_dir=self.temp_dir, batch_size=8, repeat=1)

    dataset = train_input_fn()
    features, labels = dataset.make_one_shot_iterator().get_next()

    with self.session() as sess:
      features, labels = sess.run((features, labels))

      # Compare the two features dictionaries.
      for key in TEST_INPUT_VALUES:
        self.assertTrue(key in features)
        self.assertAllClose(TEST_INPUT_VALUES[key], features[key][0])

      self.assertAllClose(labels[0], [1.0])

  @unittest.skipIf(keras_utils.is_v2_0(), "TF 1.0 only test.")
  def test_end_to_end_deep(self):
    integration.run_synthetic(
        main=meals_main.main, tmp_root=self.temp_dir,
        extra_flags=[
            "--data_dir", self.temp_dir,
            "--download_if_missing=false",
            "--train_epochs", "1",
            "--epochs_between_evals", "1"
        ],
        synth=False, max_train=None)


if __name__ == "__main__":
  tf.test.main()
