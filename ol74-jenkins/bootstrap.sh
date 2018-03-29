#!/usr/bin/sh
echo "provisioning the box"
yum -y install java-1.8.0-openjdk.x86_64 jenkins 
yum clean all
cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
source /etc/profile
yum install -y jenkins
yum clean all
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service