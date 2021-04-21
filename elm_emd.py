# -*- coding: utf-8 -*-
"""
Created on Wed Aug 19 17:42:43 2020

@author: Atik
"""


import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import MinMaxScaler
from sklearn import preprocessing
from scipy.linalg import pinv2

data = pd.read_csv(r'D:\OneDrive - Universiti Malaysia Pahang\Atik_Home\Data Files\Codes\emd_4.csv')
X = data.iloc[:,:-1].values
y = data.iloc[:,-1].values

# normalize the data attributes
X = preprocessing.normalize(X)

# Train test split 80:20
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

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

def hidden_nodes(X):
    G = np.dot(X, input_weights)
    G = G + biases
    H = relu(G)
    return H

output_weights = np.dot(pinv2(hidden_nodes(X_train)), y_train)

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

from sklearn.metrics import confusion_matrix
confusion_matrix(y_test, prediction)
