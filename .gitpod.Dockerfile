FROM gitpod/workspace-full

RUN brew install kubectl
RUN wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
RUN sudo apt update && sudo apt install -y virtualbox-6.0
RUN brew install minikube