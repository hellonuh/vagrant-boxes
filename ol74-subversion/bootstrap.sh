#!/usr/bin/sh
echo "provisioning the box"
yum install -y httpd subversion mod_dav_svn
yum clean all && rm -rf /var/cache/yum
mkdir -p /var/local/svn
mkdir /etc/httpd/dav_svn
cp /vagrant/files/dav_svn.conf /etc/httpd/config.modules.d/
cp /vagrant/files/dav_svn_authz /etc/httpd/dav_svn/
cp /vagrant/files/svn-project-creator.sh /usr/local/bin/
chmod a+x /usr/local/bin/svn*
htpasswd -bc /etc/httpd/dav_svn/dav_svn.passwd admin admin
htpasswd -bc /etc/httpd/dav_svn/dav_svn.passwd jenkins jenkins
htpasswd -bc /etc/httpd/dav_svn/dav_svn.passwd readonly readonly
svnadmin create /var/local/svn/testrepo
chown -R apache:apache "/var/local/svn/" && chmod -R 775 "/var/local/svn/"
systemctl start httpd
systemctl enable httpd