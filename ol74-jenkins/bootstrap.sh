#!/usr/bin/sh
echo "provisioning the box"
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install java-1.8.0-openjdk.x86_64 jenkins 
yum clean all && rm -rf /var/cache/yum
cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
source /etc/profile
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service