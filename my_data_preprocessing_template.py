# Data Preprocessing

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('data.csv')
X = dataset.iloc[:,:-1].values
y = dataset.iloc[:,-1].values

# Taking care of missing data
from sklearn.impute import SimpleImputer
imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean', fill_value = 0)
imputer = imputer.fit(X[:, 1:3]) 
X[:, 1:3] = imputer.transform(X[:, 1:3])

#Encoding Categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.compose import ColumnTransformer
labelencoder_X = LabelEncoder()
X[:, 0] = labelencoder_X.fit_transform(X[:, 0])
transformer = ColumnTransformer([('one_hot_encoder', OneHotEncoder(), [0])],remainder='passthrough')
X = np.array(transformer.fit_transform(X), dtype=np.float)
# Encoding Y data
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)

# Spliliting the dataset into train and test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, train_size = 0.8, random_state = 42)

 # Feature scalling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)