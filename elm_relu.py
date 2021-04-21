# -*- coding: utf-8 -*-
"""
Created on Thu Aug 27 16:33:00 2020

@author: DELL
"""
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D
from tensorflow.keras.layers import MaxPooling2D
from tensorflow.keras.layers import Flatten
from tensorflow.keras.layers import Dense

import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import MinMaxScaler

train = pd.read_csv('mnist_train.csv')
test = pd.read_csv('mnist_test.csv')

onehotencoder = OneHotEncoder(categories='auto')
scaler = MinMaxScaler()

X_train = scaler.fit_transform(train.values[:,1:])
y_train = onehotencoder.fit_transform(train.values[:,:1]).toarray()

X_test = scaler.fit_transform(test.values[:,1:])
y_test = onehotencoder.fit_transform(test.values[:,:1]).toarray()

input_size = X_train.shape[1]

hidden_size = 1000

input_weights = np.random.normal(size=[input_size,hidden_size])
biases = np.random.normal(size=[hidden_size])

def relu(x):
   return np.maximum(x, 0, x)

def hidden_nodes(X):
    G = np.dot(X, input_weights)
    G = G + biases
    H = relu(G)
    return H

from scipy import linalg

output_weights = np.dot(linalg.pinv2(hidden_nodes(X_train)), y_train)


def predict(X):
    out = hidden_nodes(X)
    out = np.dot(out, output_weights)
    return out

prediction = predict(X_test)
correct = 0
total = X_test.shape[0]
for i in range(total):
    predicted = np.argmax(prediction[i])
    actual = np.argmax(y_test[i])
    correct += 1 if predicted == actual else 0
accuracy = correct/total
print('Accuracy for ', hidden_size, ' hidden nodes: ', accuracy)



