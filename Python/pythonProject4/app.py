from flask import Flask, request, jsonify
import h5py
import cv2
from keras.preprocessing import image
import numpy as np
from keras.models import load_model
from keras.models import Sequential
import h5py
from azure.storage.blob import BlobClient
from io import BytesIO
from xml.dom import minidom
import os
from mtcnn import MTCNN

app = Flask(__name__)

# con_str = 'DefaultEndpointsProtocol=https;AccountName=emotion4recognition;AccountKey=X6kgGiJ5Z1ubhcudUY2rwevyHTU5MQ3f9wPaXWsZVFH59rAMxZInFrxTviSLoy/ZmbZblgAFF+1G+AStKSPGbw==;EndpointSuffix=core.windows.net'
# blob_client = BlobClient.from_connection_string(con_str, blob_name='haarcascade_frontalface_alt2.xml',
#                                                 container_name='model')
# downloader_xml = blob_client.download_blob(0)
# xml = downloader_xml.content_as_text()
# save_path_file = "face_detector.xml"
# with open(save_path_file, "w") as f:
#     doc = f.write(xml)

con_str = 'DefaultEndpointsProtocol=https;AccountName=emotion4recognition;AccountKey=X6kgGiJ5Z1ubhcudUY2rwevyHTU5MQ3f9wPaXWsZVFH59rAMxZInFrxTviSLoy/ZmbZblgAFF+1G+AStKSPGbw==;EndpointSuffix=core.windows.net'
blob_client = BlobClient.from_connection_string(con_str, blob_name='face_recognition.h5',container_name='model')
downloader_h5 = blob_client.download_blob(0)


with BytesIO() as f:
    downloader_h5.readinto(f)
    with h5py.File(f, 'r') as h5file:
        emotion_model = load_model(h5file)



label_dict = {0: 'Angry', 1: 'Fear', 2: 'Happy', 3: 'Sad', 4: 'Neutral'}
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}

def allowed_file(filename):
    # xxx.png
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def facecrop(image):
    faceboxes = []
    faces_list = []
    nparr = np.fromstring(image, np.uint8)
    imag = cv2.imdecode(nparr, cv2.IMREAD_UNCHANGED)
    img = cv2.cvtColor(imag, cv2.COLOR_BGR2RGB)
    detector = MTCNN()
    for i in range(len(detector.detect_faces(img))):
        faceboxes.append(detector.detect_faces(img)[i]['box'])
    face = np.array(faceboxes)
    if np.any(face):
        for (x, y, w, h) in face:
            cv2.rectangle(img, (x, y), (x + w, y + h), (0, 0, 255), 2)
            face = img[y:y + h, x:x + w]
            cv2.imwrite('face.jpg', face)
            resized_face = cv2.resize(face, (48, 48))
            gray_face = cv2.cvtColor(resized_face, cv2.COLOR_BGR2GRAY)
            faces_list.append(gray_face)
        return faces_list
    #else:

        #return jsonify({'error': 'There is no face to detect'})



@app.route('/', methods=['POST'])
def predict():
    if request.method == 'POST':
        file = request.files.get('images')
        if file is None or file.filename == "":
            return jsonify({'error': 'no file'})
        if not allowed_file(file.filename):
            return jsonify({'error': 'format not supported'})

        try:
            labels = []
            img_bytes = file.read()
            faces_list = facecrop(img_bytes)
            faces = np.array(faces_list)
            for i in range(len(faces_list)):
                x_test = faces[i].reshape(48, 48, -1)
                x = np.expand_dims(x_test, axis=0)
                custom = emotion_model.predict(x)
                custom = list(custom[0])
                emotion_index = custom.index(max(custom))
                print(label_dict[emotion_index])
                labels.append(label_dict[emotion_index])
                data = {'prediction': labels}
            return jsonify(data)
        except:
            return jsonify({'error': 'there is no face to detect'})


if __name__ == "__main__":

    app.run(port=8000,debug=True)
