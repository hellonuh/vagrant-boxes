#!/usr/bin/env bash
echo "Lets begin"
# Install jdk and set java home
rpm -ivh /vagrant/jenkins/software/jdk-8u101-linux-x64.rpm
tar -zxvf /vagrant/jenkins/software/apache-ant-1.9.9-bin.tar.gz -C /usr/local
tar -zxvf /vagrant/jenkins/software/apache-maven-3.5.2-bin.tar.gz -C /usr/local
#yum -y install epel-release
#yum clean all
cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_101' | tee -a /etc/profile
echo 'export JRE_HOME=/usr/java/jdk1.8.0_101' | tee -a /etc/profile
echo 'export ANT_HOME=/usr/local/apache-ant-1.9.9' | tee -a /etc/profile
echo 'export M2_HOME=/usr/local/apache-maven-3.5.2' | tee -a /etc/profile
echo 'export M2=$M2_HOME/bin' | tee -a /etc/profile
echo 'export PATH=$PATH:$ANT_HOME/bin:$M2' | tee -a /etc/profile
source /etc/profile
# Start jenkins install
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y install jenkins nginx
yum clean all
systemctl start jenkins.service
systemctl enable jenkins.service
systemctl start nginx.service
systemctl enable nginx.service
# Done
echo "Java installation done"