#!/bin/bash

sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

sudo yum update -y
sudo yum install git -y

git clone "https://github.com/shaffi3000/flask_docker_v1"
cd flask_docker_v1

sudo docker image build -t python-app .

sudo docker run -p 5001:5000 -d python-app