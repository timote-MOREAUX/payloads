import os

from time import sleep

from PIL import Image
import ctypes
import requests

url = "https://cdn.wallpapersafari.com/53/89/LefMat.png"
# download image from url in a file in user directory

response = requests.get(url)
with open('screenshot.png', 'wb') as file:
    file.write(response.content)
image_path = os.path.abspath('screenshot.png')
ctypes.windll.user32.SystemParametersInfoW(20, 0, image_path, 0)
