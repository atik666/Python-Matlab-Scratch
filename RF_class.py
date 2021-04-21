# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Feat_EMD.csv')

X = dataset.iloc[:,:-1].values
y = dataset.iloc[:,-1].values

# Making partition
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, train_size = 0.8, random_state = 42)

# Random Forest classfier
from sklearn.ensemble import RandomForestClassifier
# Instantiate model with 1000 decision trees
rf = RandomForestClassifier(n_estimators = 1000, criterion = 'gini', random_state = 0)

# Train the model on training data
rf.fit(X_train, y_train)

# Making predictions
pred = rf.predict(X_test)

# Creating confusion matrix
from sklearn.metrics import confusion_matrix
conf_mat = confusion_matrix(pred, y_test)

# Calculating the accuracy
accuracy = conf_mat.diagonal().sum() / conf_mat.sum() * 100

print('The confusion matrix: \n', conf_mat, '\n the accuracy is: \n', accuracy)

