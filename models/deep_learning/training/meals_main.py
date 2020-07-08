
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
from absl import app as absl_app
from absl import flags
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

import meals
from utils.flags import core as flags_core
from utils.logs import logger
import meals_dataset
import wide_deep_run_loop


def define_meal_flags():
    """Define flags for meal dataset training."""
    wide_deep_run_loop.define_wide_deep_flags()
    flags.DEFINE_enum(
      name="dataset", default=meals.FOOD,
      enum_values=meals.DATASETS, case_sensitive=False,
      help=flags_core.help_wrap("Dataset to be trained and evaluated."))
    flags.adopt_module_key_flags(wide_deep_run_loop)
    flags_core.set_defaults(data_dir="../../dataset/csv_file/",
                            model_dir='../model_saved_ckp/',
                            train_epochs=150,
                            epochs_between_evals=5,
                            inter_op_parallelism_threads=0,
                            intra_op_parallelism_threads=0,
                            batch_size=40)

    @flags.validator("stop_threshold",
                   message="stop_threshold not supported for meals model")
    def _no_stop(stop_threshold):
        return stop_threshold is None


def build_estimator(model_dir, model_type, model_column_fn, inter_op, intra_op):
    """Build an estimator appropriate for the given model type."""
    wide_columns, deep_columns = model_column_fn()
    hidden_units = [256, 256, 256, 128]

    run_config = tf.estimator.RunConfig().replace(
      session_config=tf.ConfigProto(device_count={'GPU': 0},
                                    inter_op_parallelism_threads=inter_op,
                                    intra_op_parallelism_threads=intra_op))
    if model_type == 'deep':
        return tf.estimator.DNNRegressor(
          model_dir=model_dir,
          feature_columns=deep_columns,
          hidden_units=hidden_units,
          optimizer=tf.train.AdamOptimizer(),
          activation_fn=tf.nn.sigmoid,
          dropout=0.3,
          loss_reduction=tf.losses.Reduction.MEAN,
          config=run_config)
    else:
        return tf.estimator.DNNLinearCombinedRegressor(
          model_dir=model_dir,
          linear_feature_columns= wide_columns,
          dnn_feature_columns= deep_columns,
          dnn_hidden_units= hidden_units)


def run_meal(flags_obj):
    """Construct all necessary functions and call run_loop.

    Args:
      flags_obj: Object containing user specified flags.
    """


    # print('dataset: ',flags_obj.dataset )
    dir_path = "../../../dataset/csv_file/"
    # dir_path = "/home/hungdo/HungDo/Meals-RS/dataset/csv_file/"
    print('dir: ', flags_obj.data_dir )
    train_input_fn, eval_input_fn, model_column_fn = \
      meals_dataset.construct_input_fns(
        dataset=flags_obj.dataset, data_dir=dir_path,
        batch_size=flags_obj.batch_size, repeat=flags_obj.epochs_between_evals)
    #
    # print('----------------------------')
    # print(train_input_fn)
    # print('----------------------------')

    
    tensors_to_log = {
        'average_loss': '{loss_prefix}head/truediv',
        'loss': '{loss_prefix}head/weighted_loss/Sum'
    }

    # tensors_to_log = {
    #     'loss': '{loss_prefix}head/weighted_loss/value'
    # }

    average_loss_arr, label_mean_arr, loss_arr, prediction_mean_arr = wide_deep_run_loop.run_loop(
        name="Meals", train_input_fn=train_input_fn,
        eval_input_fn=eval_input_fn,
        model_column_fn=model_column_fn,
        build_estimator_fn=build_estimator,
        flags_obj=flags_obj,
        tensors_to_log=tensors_to_log,
        early_stop=False)

    # print('average: ', average_loss_arr)
    # print('label: ', label_mean_arr)
    # print('loss: ', loss_arr)
    # print('prediction: ', prediction_mean_arr)

    # Display Loss
    line_average_loss = plt.plot(average_loss_arr, label='Average Loss')
    line_loss = plt.plot(loss_arr, label='Loss')
    plt.setp(line_average_loss, linewidth=1)
    plt.setp(line_loss, linewidth=1)
    plt.legend(loc='upper right')

    plt.title('Evaluate Loss')
    plt.xlabel('Epochs')
    plt.ylabel('Values')
    plt.savefig('./average_loss.png')


    # Display Label and Prediction
    plt.clf()
    line_label = plt.plot(label_mean_arr, label='Label/Mean')
    line_prediction = plt.plot(prediction_mean_arr, label='Prediction/Mean')
    plt.setp(line_label, linewidth=1)
    plt.setp(line_prediction, linewidth=1)
    plt.legend(loc='upper right')

    plt.title('Evaluate Prediction and Label')
    plt.xlabel('Epochs')
    plt.ylabel('Values')

    plt.savefig('./prediction_label.png')



def main(_):
    with logger.benchmark_context(flags.FLAGS):
      run_meal(flags.FLAGS)


if __name__ == '__main__':
    tf.logging.set_verbosity(tf.logging.INFO)
    define_meal_flags()
    absl_app.run(main)
