import sys
import cv2 as cv 
import numpy as np
import matplotlib.pyplot as plt 
from tensorflow.keras import datasets, layers, models

# Set the output encoding to utf-8
sys.stdout.reconfigure(encoding='utf-8')

# Load CIFAR-10 dataset
(training_images, training_labels), (testing_images, testing_labels) = datasets.cifar10.load_data()
training_images, testing_images = training_images / 255.0, testing_images / 255.0

# Define class names for CIFAR-10
class_names = ['Plane', 'Car', 'Bird', 'Cat', 'Deer', 'Dog', 'Frog', 'Horse', 'Ship', 'Truck']
'''
# Plot the first 16 images from the dataset
for i in range(16):
    plt.subplot(4, 4, i+1)
    plt.xticks([])
    plt.yticks([])
    plt.imshow(training_images[i], cmap=plt.cm.binary)
    plt.xlabel(class_names[training_labels[i][0]])
plt.show()
'''
# Reducing the dataset size for faster computation in this example
training_images = training_images[:20000]
training_labels = training_labels[:20000]
testing_images = testing_images[:4000]
testing_labels = testing_labels[:4000]

model = models.load_model('image_classifier.h5')

img = cv.imread('deer_32x32.jpg')
img = cv.cvtColor(img,cv.COLOR_BGR2RGB)

plt.imshow(img,cmap=plt.cm.binary)
prediction = model.predict(np.array([img]) / 255)
index = np.argmax(prediction)
print(f"Prediction is {class_names[index]}")

plt.show()