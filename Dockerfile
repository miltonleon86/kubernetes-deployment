FROM ubuntu:16.04

# update
RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv make
RUN apt-get install -y git wget

# phython pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

# Kubectl install
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.8.7/bin/linux/amd64/kubectl
RUN mv kubectl /usr/local/bin/
RUN chmod +x /usr/local/bin/kubectl

ADD / /

RUN mkdir /root/.kube/

# Normally you should get the config from gitlat-ci secret. 
RUN cat kube_config | base64 -d >> config
RUN mv config /root/.kube/


