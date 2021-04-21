import numpy as np
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras 

observations = 1000

# input
xs = np.random.uniform(low = -10, high = 10, size=(observations,1))
zs = np.random.uniform(-10,10,(observations,1))

generated_inputs = np.column_stack((xs,zs))

print(generated_inputs.shape)

noise = np.random.uniform(-1,1,(observations,1))

generated_targets = 2*xs - 3*zs + 5 + noise 

np.savez('TF_intro', inputs = generated_inputs, targets = generated_targets)

training_data = np.load('TF_intro.npz')

input_size = 2
output_size = 1

model = tf.keras.Sequential([
    tf.keras.layers.Dense(output_size)
    ])

model.compile(optimizer = 'sgd', loss='mean_squared_error') 

model.fit(training_data['inputs'],training_data['targets'],epochs=100,verbose=0)


