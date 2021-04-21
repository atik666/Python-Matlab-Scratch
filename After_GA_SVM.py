# -*- coding: utf-8 -*-
"""
Created on Thu May 21 12:56:30 2020

@author: samsung
"""

import numpy as np
import pandas as pd
import random as rd
from sklearn.model_selection import cross_validate
from sklearn.model_selection import train_test_split
from sklearn.model_selection import KFold
from sklearn import preprocessing
from sklearn import svm
from sklearn.metrics import mean_squared_error

# Loading the data, shuffling and preprocessing it

Data = pd.read_csv("Data.csv")

Data = Data.sample(frac=1)

X1 = pd.DataFrame(Data,columns=['X1','X2','X3','X4','X5','X6','X7','X8'])

Y = pd.DataFrame(Data,columns=['Y1']).values


Xbef = pd.get_dummies(X1,columns=['X6','X8'])


min_max_scalar = preprocessing.MinMaxScaler()

X = min_max_scalar.fit_transform(Xbef)

Cnt1 = len(X)
print()
print("# of Observations:",Cnt1)


kfold = 10

SVMClass = svm.SVR()

Count1 = 1
Aa1 = 0

Cnt1 = len(X)

kf = KFold(n_splits=kfold)
kf.get_n_splits(X)

for train_index,test_index in kf.split(X):
    X_train, X_test = X[train_index], X[test_index]
    Y_train, Y_test = Y[train_index], Y[test_index]
    
    model1 = SVMClass
    model1.fit(X_train, Y_train)
    Pa_1=model1.predict(X_test)
    AC1=model1.score(X_test,Y_test)
    
    Aa1 += AC1
       
print()
print("R2 for SVM W/O GA: %f" % (Aa1/kfold))




SVMClass = svm.SVR(kernel='rbf', C=517.6958681667545, gamma=0.23073626816010195)

Count1 = 1
Aa1 = 0

Cnt1 = len(X)

kf = KFold(n_splits=kfold)
kf.get_n_splits(X)

for train_index,test_index in kf.split(X):
    X_train, X_test = X[train_index], X[test_index]
    Y_train, Y_test = Y[train_index], Y[test_index]
    
    model1 = SVMClass
    model1.fit(X_train, Y_train)
    Pa_1=model1.predict(X_test)
    AC1=model1.score(X_test,Y_test)
    
    Aa1 += AC1
       
print()
print("R2 for SVM W/ GA: %f" % (Aa1/kfold))

