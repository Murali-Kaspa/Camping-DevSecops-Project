################################################
# Created This Script : Murali Krishna Kaspa    #
# Date : 30-May-2025			       #
# Script : Packages_Installation		       #	
################################################


#!/bin/bash

#GITHUB
sudo yum install git -y 

#Jenkins
sudo yum install java-17-amazon-corretto -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
sudo service jenkins start
echo "JENKINS PASSSWORD"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


#Terraform
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#Docker

sudo yum install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -aG docker $USER

sleep 10 

#Sonarube_Docker_Image
docker run -itd --name sonarimage -p 9000:9000 sonarqube:lts-community

#TRIVY 

# 1. Download the latest RPM package
wget https://github.com/aquasecurity/trivy/releases/download/v0.64.1/trivy_0.64.1_Linux-64bit.rpm

# 2. Install the package
sudo rpm -ivh trivy_0.64.1_Linux-64bit.rpm

# 3. Verify installation
trivy --version

sleep 20

echo "Displaying Versions"


git_version=$(git --version)
jenkins_version=$(jenkins --version)
docker_version=$(docker --version)
trivy_version=$(trivy --version)
terraform_version=$(terraform version | head -n 1)

echo "-----------------------------------"
echo "| Tool Name  | Version             |"
echo "-----------------------------------"
echo "| Git        | $git_version        |"
echo "| Jenkins    | $jenkins_version    |"
echo "| Docker     | $docker_version     |"
echo "| Trivy      | $trivy_version      |"
echo "| Terraform  | $terraform_version  |"
echo "------------------------------------"


