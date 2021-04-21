# Support Vector Machine (SVM)
# Importing the libraries
import pandas as pd
import numpy as np
import random

# Importing the dataset
column = [*range(0,10)]
b1 = pd.read_csv(r'D:\Atik\pythonScripts\Data Final\Partition\Blade Set\svm\b1.csv'
                      , names = column)

category = ["l1",'l2','l3','l1l3','l1l2','l2l3','l1l2l3',
          "r1",'r2','r3','r1r3','r1r2','r2r3','r1r2r3',
          "t1",'t2','t3','t1t3','t1t2','t2t3','t1t2t3']
list = []
for i in category:
    data = pd.read_csv(r'D:\Atik\pythonScripts\Data Final\Partition\Blade Set\svm\%s.csv' 
                       %i, names = column)
    list.append(data)
x2 = np.vstack(list)
#random.shuffle(fault)

y1 = np.zeros(len(b1)) 

y2 = np.ones(len(x2))

x = np.concatenate((b1, x2))

y = np.concatenate((y1, y2))

# Feature Scaling
from sklearn.preprocessing import normalize
x = normalize(x)

# Splitting the dataset into the Training set and Test set
# from sklearn.model_selection import train_test_split
# X_train1, X_test1, y_train1, y_test1 = train_test_split(b1, y1, 
#                           test_size = 0.375,stratify=y1)
# X_val1, X_test1, y_val1, y_test1  = train_test_split(X_test1, y_test1, 
#                                     test_size = 0.5,stratify=y_test1)

# X_train2, X_test2, y_train2, y_test2 = train_test_split(x2, y2, 
#                                         test_size = 0.166,stratify=y2)
# X_val2, X_test2, y_val2, y_test2  = train_test_split(X_test2, y_test2,
#                                         test_size = 0.5,stratify=y_test2)

from sklearn.model_selection import train_test_split
X_train1, X_test1, y_train1, y_test1 = train_test_split(x, y, 
                           test_size = 0.375,stratify=y)

X_val1, X_test1, y_val1, y_test1  = train_test_split(X_test1, y_test1, 
                                  test_size = 0.5,stratify=y_test1)

# Training the SVM model on the Training set
# from sklearn.svm import SVC
# classifier = SVC()
from sklearn.neighbors import KNeighborsClassifier
classifier = KNeighborsClassifier(n_neighbors=5)
classifier.fit(X_train1, y_train1)

# Predicting the Test set results
y_pred = classifier.predict(X_test1)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test1, y_pred)
print(cm)
    
def accuracy(confusion_matrix):
    diagonal_sum = confusion_matrix.trace()
    sum_of_all_elements = confusion_matrix.sum()
    return diagonal_sum / sum_of_all_elements 

Accuracy = accuracy(cm)
print(Accuracy)
print(classifier.fit(X_train1, y_train1).score(X_train1, y_train1))