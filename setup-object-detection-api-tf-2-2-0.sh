sudo apt-get update
sudo mkdir ~/TensorFlow
sudo chmod -R 777 ~/TensorFlow
sudo apt-get --no-install-recommends install -y python3-pip python3-setuptools python3-dev python-setuptools python-pip python-dev 
sudo apt-get install -y protobuf-compiler python-pil python-lxml python-tk
sudo apt-get install -y build-essential
sudo apt-get install make 
sudo apt-get install unzip
# upgrade pip
#python3 -m pip install --upgrade pip
export PATH=~/.local/bin$PATH
pip3 install --upgrade pip
pip install wheel
# clone models from github
cd ~/TensorFlow
git clone https://github.com/tensorflow/models.git
cd ~/TensorFlow/models/research
# Protobuf Installation/Compilation
#wget https://github.com/protocolbuffers/protobuf/releases/download/v3.12.3/protoc-3.12.3-linux-x86_64.zip
#unzip protoc-3.12.3-linux-x86_64.zip -d ~/protoc
protoc object_detection/protos/*.proto --python_out=.

#COCO API installation
cd ~/TensorFlow/models
pip install cython numpy matplotlib cmake

git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
make
cp -r pycocotools ~/TensorFlow/models/research/
pip3 install scikit-build
pip3 install cython numpy matplotlib
#pip3 install git+https://github.com/philferriere/cocoapi.git#subdirectory=PythonAPI

# Install the Object Detection API
cd ~/TensorFlow/models/research
# From within TensorFlow/models/research/
cp object_detection/packages/tf2/setup.py .
python3 -m pip install .
pip3 install tensorflow==2.2.0

# Test your Installation
# From within TensorFlow/models/research/
python3 object_detection/builders/model_builder_tf2_test.py
