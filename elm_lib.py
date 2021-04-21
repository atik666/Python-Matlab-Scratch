# -*- coding: utf-8 -*-
"""
Created on Sat Aug 22 22:54:56 2020

@author: DELL
"""

import elm

import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import MinMaxScaler

data = pd.read_csv("EMD_4.csv") 
X = data.iloc[0:900,:-1].values
y = data.iloc[0:900,-1].values

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# create a classifier
elmk = elm.ELMKernel()

# search for best parameter for this dataset
# define "kfold" cross-validation method, "accuracy" as a objective function
# to be optimized and perform 10 searching steps.
# best parameters will be saved inside 'elmk' object
elmk.search_param(data, cv="kfold", of="accuracy", eval=10)

#train and test
# results are Error objects
tr_result = elmk.train(X_train)
te_result = elmk.test(X_test)

print(te_result.get_accuracy)