import cv2
from keras.preprocessing import image
import numpy as np
import matplotlib.pyplot as plt
from keras.models import load_model


def facecrop(image):
    faces_list = []
    img = cv2.imread(image)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    face_cascade = cv2.CascadeClassifier('F:/Faculty/Graduation Project/Code/haarcascade_frontalface_alt2.xml')
    face = face_cascade.detectMultiScale(gray, 1.1, 4)

    for (x, y, w, h) in face:
        cv2.rectangle(img, (x, y), (x + w, y + h), (0, 0, 255), 2)
        face = img[y:y + h, x:x + w]
        cv2.imwrite('face.jpg', face)
        resized_face = cv2.resize(face, (48, 48))
        gray_face = cv2.cvtColor(resized_face, cv2.COLOR_BGR2GRAY)
        faces_list.append(gray_face)

    # Display the output
    # cv2.imwrite('detcted.jpg', img)
    # plt.imshow(img)
    #cv2.waitKey()
    return faces_list


emotion_model = load_model("F:/Downloads/face_recognition.h5")

label_dict = {0: 'Angry', 1: 'Fear', 2: 'Happy', 3: 'Sad', 4: 'Neutral'}

file = 'F:/Faculty/Graduation Project/diff2.jpg'
true_image = image.load_img(file)
img = image.load_img(file, color_mode="grayscale", target_size=(48, 48))

faces_list = facecrop(file)
faces = np.array(faces_list)

for i in range(len(faces_list)):
    x = np.expand_dims(faces[i], axis=0)
    print(x.shape)
    custom = emotion_model.predict(x)

    custom = list(custom[0])

    emotion_index = custom.index(max(custom))
    print(label_dict[emotion_index])
