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
from sklearn.metrics import confusion_matrix

data = pd.read_csv(r"D:\AAA\Udemy - Deep Learning A-Ztrade;_ Hands-On Artificial Neural Networks [Desire Course]\29. Data Preprocessing Template\dataCSP.csv") 
X = data.iloc[:,:-1].values
y = data.iloc[:,-1].values

scaler = MinMaxScaler()
X = scaler.fit_transform(X)
y =  pd.get_dummies(y)

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25, random_state = 0)

input_size = X_train.shape[1]

hidden_size = 100

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
y_test = y_test.to_numpy()

for i in range(total):
    predicted = np.argmax(prediction[i])
    actual = np.argmax(y_test[i])
    correct += 1 if predicted == actual else 0
accuracy = correct/total*100
print('Accuracy for ', hidden_size, ' hidden nodes: ', accuracy)

# Making the confusion matrix

# Retriving class labels from the output wieght           
prediction = np.argmax(prediction, axis = -1)+1 

# Reverting to test labels from dummy variables                            
y_test = pd.DataFrame(y_test)
y_test = y_test.idxmax(axis=1)+1     
            
# Creating the confusion matrix
cm = confusion_matrix(y_test, prediction)
print(cm)
            
            
            