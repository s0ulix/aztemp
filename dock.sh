sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo gpasswd -a $USER docker

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

docker pull twallace27603/pythonserver:latest
[concat('docker tag twallace27603/pythonserver:latest ',reference(variables('loginServer'),'2017-10-01').loginServer,'/taskimage:1.0')]
[concat('docker login -u ',variables('acrName'),' ',reference(variables('loginServer'),'2017-10-01').loginServer,' -p ',listCredentials(variables('loginPass'),'2017-10-01').passwords[0].value)]
[concat('docker push ',reference(variables('loginServer'),'2017-10-01').loginServer,'/taskimage:1.0>')]
