import numpy as np
import tensorflow as tf

corpus_raw = "He is the king . The king is royal . She is the royal  queen"
# Convert to lower case
corpus_raw = corpus_raw.lower()

words = []
for word in corpus_raw.split():
    if word != ".":  # we need remove "."
        words.append(word)
words = set(words)  # We create dictionary so remove duplicate word

word2int = {}
int2word = {}
vocab_size = len(words)
for i, word in enumerate(words):
    word2int[word] = i
    int2word[i] = word
# Raw sentence as list
raw_sentence = corpus_raw.split(".")
sentences = []
for sentence in raw_sentence:
    sentences.append(sentence.split())
# Generate training data
data = []
Window_size = 2
for sentence in sentences:
    for word_index, word in enumerate(sentence):
        for nb_word in sentence[max(word_index - Window_size, 0): min(word_index + Window_size, len(sentence)) + 1]:
            if nb_word != word:
                data.append([word, nb_word])

# function to convert numbers to one hot vectors

def to_one_hot(data_point_index, vocab_size):
    temp = np.zeros(vocab_size)
    temp[data_point_index] = 1
    return temp

x_train = []  # input word
y_train = []  # output word
for data_word in data:
    x_train.append(to_one_hot(word2int[data_word[0]], vocab_size))
    y_train.append(to_one_hot(word2int[data_word[1]], vocab_size))

x_train = np.asarray(x_train)
y_train = np.asarray(y_train)


# placeholder
X = tf.placeholder(tf.float32, [None, 7])
Y = tf.placeholder(tf.float32, [None, 7])
# variable hiden 1
W1 = tf.Variable(tf.random_normal([7, 5]))
b1 = tf.Variable(tf.constant(0.1, shape=[5]))
hiden_1 = tf.matmul(X, W1) + b1
# variable hiden 2
W2 = tf.Variable(tf.random_normal([5, 7]))
b2 = tf.Variable(tf.constant(0.1, shape=[7]))
hiden_2 = tf.matmul(hiden_1, W2) + b2
# loss function
cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(labels=Y, logits=hiden_2))
# optimizer
optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.01).minimize(cross_entropy)
# initializer
init = tf.global_variables_initializer()
sess = tf.Session()
sess.run(init)
for i in range(1000):
    sess.run(optimizer, feed_dict={X: x_train, Y: y_train})
predict = tf.equal(tf.arg_max(hiden_2, 1), tf.arg_max(Y, 1))
accuracy = tf.reduce_mean(tf.cast(predict, tf.float32))

print(predict)
print(accuracy)