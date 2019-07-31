#!/usr/bin/env bash
# set env variables in bash profile
cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/java/default' | sudo tee -a /etc/profile
# install common utils
yum install -y curl wget zip unzip
# install java
rpm -ivh /vagrant/software/jdk-8u181-linux-x64.rpm
# install nodejs
yum install -y gcc-c++ make curl wget zip unzip
curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
yum install -y nodejs
# install docker
yum install -y docker-engine
systemctl start docker
systemctl enable docker
usermod -aG docker vagrant
# install svn
yum install -y httpd subversion mod_dav_svn
mkdir -p /var/local/svn && mkdir /etc/httpd/dav_svn
cp /vagrant/software/svnfiles/dav_svn.conf /etc/httpd/conf.modules.d/
cp /vagrant/software/svnfiles/dav_svn.authz /etc/httpd/dav_svn/
cp /vagrant/software/svnfiles/svn-project-creator.sh /usr/local/bin/
chmod a+x /usr/local/bin/svn*
test ! -d "/var/local/svn/testrepo" && svnadmin create /var/local/svn/testrepo
htpasswd -bc /etc/httpd/dav_svn/dav_svn.passwd admin admin
htpasswd -b /etc/httpd/dav_svn/dav_svn.passwd jenkins jenkins
htpasswd -b /etc/httpd/dav_svn/dav_svn.passwd nuh nuh
htpasswd -b /etc/httpd/dav_svn/dav_svn.passwd readonly readonly
chown -R apache:apache "/var/local/svn/" && chmod -R 775 "/var/local/svn/"
service httpd start
chkconfig httpd on
#end
echo "done"
