# -*- coding: utf-8 -*-
"""
Created on Thu Jun 25 12:15:12 2020

@author: Atik
"""
# Data Preprocessing

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Feat_EMD.csv')

X = dataset.iloc[:,:-1].values
y = dataset.iloc[:,-1].values

from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, train_size = 0.8, random_state = 42)

dtc = DecisionTreeClassifier()
dtc.fit(X_train, y_train)

pred = dtc.predict(X_test)

conf_mat = confusion_matrix(pred, y_test)

acuracy = conf_mat.diagonal().sum() / conf_mat.sum() * 100

#dtc.predict_proba(X_test)

feat_imp = dtc.feature_importances_

imp_list = list(feat_imp)

feat_select = pd.DataFrame({"Feature_name" : dataset.iloc[:,:-1].columns, "Importance" : imp_list})

imp_list_select = feat_select.sort_values("Importance", ascending = False, )

#from sklearn.externals.six import StringIO
from io import StringIO
from IPython.display import Image
from sklearn.tree import export_graphviz
import pydotplus
import pydot
import os

dot_data = StringIO()
import matplotlib.pyplot as plt
fig = plt.figure(figsize=(12,12))

export_graphviz(dtc, out_file = dot_data,
                filled = True, rounded = True, special_characters = False)

graph = pydotplus.graph_from_dot_data(dot_data.getvalue())

(graph,) = pydot.graph_from_dot_data(dot_data.getvalue())

Image(graph.create_png())

graph.write_pdf("EMD.pdf")


                
