# Support Vector Machine (SVM)
# Importing the libraries
import pandas as pd
import numpy as np
import random
from sklearn.preprocessing import normalize

# Importing the dataset
column = [*range(0,10)]
category1 = ["l1",'l2','l3','l1l3','l1l2','l2l3','l1l2l3']
category2 = ["r1",'r2','r3','r1r3','r1r2','r2r3','r1r2r3']
category3 = ["t1",'t2','t3','t1t3','t1t2','t2t3','t1t2t3']

def import_data(category):
    list = []
    for i in category:
        data = pd.read_csv(r'D:\Atik\pythonScripts\Data Final\Partition\Blade Set\svm\%s.csv' 
                           %i, names = column)
        list.append(data)
    x2 = np.vstack(list)
    random.shuffle(x2)
    x2 = normalize(x2)
    return x2
    
x1 = import_data(category1)
x2 = import_data(category2)
x3 = import_data(category3)

y1 = np.zeros(len(x1)) 
y2 = np.ones(len(x2))
y3 = np.full(len(x3), 2).astype('float64')

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train1, X_test1, y_train1, y_test1 = train_test_split(x1, y1, test_size = 0.375)
X_val1, X_test1, y_val1, y_test1  = train_test_split(X_test1, y_test1, test_size = 0.5)

X_train2, X_test2, y_train2, y_test2 = train_test_split(x2, y2, test_size = 0.375)
X_val2, X_test2, y_val2, y_test2  = train_test_split(X_test2, y_test2, test_size = 0.5)

X_train3, X_test3, y_train3, y_test3 = train_test_split(x3, y3, test_size = 0.375)
X_val3, X_test3, y_val3, y_test3  = train_test_split(X_test3, y_test3, test_size = 0.5)

X_train = np.concatenate((X_train1, X_train2, X_train3))
X_val = np.concatenate((X_val1, X_val2, X_val3))
X_test = np.concatenate((X_test1, X_test2, X_test3))

y_train = np.concatenate((y_train1, y_train2, y_train3))
y_test = np.concatenate((y_test1, y_test2, y_test3))
y_val = np.concatenate((y_val1, y_val2, y_val3))

# # Training the SVM model on the Training set
# from sklearn.svm import SVC
# classifier = SVC()

from sklearn.neighbors import KNeighborsClassifier
classifier = KNeighborsClassifier(n_neighbors=5)
classifier.fit(X_train, y_train)

# Predicting the Test set results
y_pred = classifier.predict(X_val)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_val, y_pred)
print(cm)

def accuracy(confusion_matrix):
    diagonal_sum = confusion_matrix.trace()
    sum_of_all_elements = confusion_matrix.sum()
    return diagonal_sum / sum_of_all_elements 

Accuracy = accuracy(cm)
print(Accuracy)

print(classifier.fit(X_train, y_train).score(X_train, y_train))