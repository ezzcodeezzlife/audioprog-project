
from keras.models import load_model
from PIL import Image, ImageOps
import numpy as np

import argparse
import random
import time

from pythonosc import udp_client

import pygame
import pygame.camera
import time
import os
clear = lambda: os.system('cls')

# initializing  the camera
pygame.camera.init()
  
# make the list of all available cameras
camlist = pygame.camera.list_cameras()

# Load the model
model = load_model('keras_model.h5')

# Create the array of the right shape to feed into the keras model
# The 'length' or number of images you can put into the array is
# determined by the first position in the shape tuple, in this case 1.
data = np.ndarray(shape=(1, 224, 224, 3), dtype=np.float32)

#cam
if camlist:

    # initializing the cam variable with default camera
    cam = pygame.camera.Camera(camlist[0], (640, 640))

    # opening the camera
    cam.start()

    
# if camera is not detected the moving to else part
else:
    print("No camera on current device")

#osc
parser = argparse.ArgumentParser()
parser.add_argument("--ip", default="127.0.0.1",
    help="The ip of the OSC server")
parser.add_argument("--port", type=int, default=4560,
    help="The port the OSC server is listening on")
args = parser.parse_args()

client = udp_client.SimpleUDPClient(args.ip, args.port)

clear()

while True:
    
     # capturing the single image
    image = cam.get_image()

    # saving the image
    pygame.image.save(image, "filename.jpg")

    # Replace this with the path to your image
    image = Image.open('filename.jpg')
    #resize the image to a 224x224 with the same strategy as in TM2:
    #resizing the image to be at least 224x224 and then cropping from the center
    size = (224, 224)
    image = ImageOps.fit(image, size, Image.ANTIALIAS)

    #turn the image into a numpy array
    image_array = np.asarray(image)
    # Normalize the image
    normalized_image_array = (image_array.astype(np.float32) / 127.0) - 1
    # Load the image into the array
    data[0] = normalized_image_array

    # run the inference
    prediction = model.predict(data)
    print("nichts:" , prediction[0][0])
    print("faust:" , prediction[0][1])
    print("allefinger:" , prediction[0][2])
    print("\n")
    
    if(prediction[0][0] >= 0.9):
        client.send_message("/score", 1)
    if(prediction[0][1] >= 0.9):
        client.send_message("/score", 2)
    if(prediction[0][2] >= 0.9):
        client.send_message("/score", 3)

    time.sleep(0.5)

    