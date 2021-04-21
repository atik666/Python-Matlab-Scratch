# Support Vector Machine (SVM)
# Importing the libraries
import pandas as pd
import numpy as np
import random
from sklearn.preprocessing import normalize

# Importing the dataset
column = [*range(0,10)]
category = ['Norm','Ball0.007','Ball0.014','Ball0.021',
            'Inner0.007','Inner0.014','Inner0.021',
            'Outer0.007','Outer0.014','Outer0.021']

def import_data(category):
    list = []
    data = pd.read_csv(r'D:\Atik\pythonScripts\Data Final\Partition\Bearing2.0\SVM\%s.csv' 
                           %category, names = column)
    list.append(data)
    x2 = np.vstack(list)
    random.shuffle(x2)
    x2 = normalize(x2)
    return x2
    
x0 = import_data(category[0])
x1 = import_data(category[1])
x2 = import_data(category[2])
x3 = import_data(category[3])
x4 = import_data(category[4])
x5 = import_data(category[5])
x6 = import_data(category[6])
x7 = import_data(category[7])
x8 = import_data(category[8])
x9 = import_data(category[9])

y0 = np.zeros(len(x0)) 
y1 = np.ones(len(x1))
y2 = np.full(len(x2), 2).astype('float64')
y3 = np.full(len(x2), 3).astype('float64')
y4 = np.full(len(x2), 4).astype('float64')
y5 = np.full(len(x2), 5).astype('float64')
y6 = np.full(len(x2), 6).astype('float64')
y7 = np.full(len(x2), 7).astype('float64')
y8 = np.full(len(x2), 8).astype('float64')
y9 = np.full(len(x2), 9).astype('float64')

x = np.concatenate((x0, x1, x2, x3, x4, x5, x6, x7, x8, x9))
y = np.concatenate((y0, y1, y2, y3, y4, y5, y6, y7, y8, y9))

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(x, y, test_size = 0.5,
                                                    stratify=y)
X_val, X_test, y_val, y_test = train_test_split(X_test, y_test, test_size = 0.5,
                                                stratify=y_test)

#Training the SVM model on the Training set
# from sklearn.svm import SVC
# classifier = SVC()

from sklearn.neighbors import KNeighborsClassifier
classifier = KNeighborsClassifier(n_neighbors=5)

classifier.fit(X_train, y_train)

# Predicting the Test set results
y_pred = classifier.predict(X_test)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
print(cm)

def accuracy(confusion_matrix):
    diagonal_sum = confusion_matrix.trace()
    sum_of_all_elements = confusion_matrix.sum()
    return diagonal_sum / sum_of_all_elements 

Accuracy = accuracy(cm)
print(Accuracy)

print(classifier.fit(X_train, y_train).score(X_train, y_train))