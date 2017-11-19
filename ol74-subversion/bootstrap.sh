#!/usr/bin/sh
echo "provisioning the box"
yum -y install subversion
yum clean all
#svn --version
mkdir /srv/svn
svnadmin create /srv/svn
yes | cp /vagrant/conf/svnserve.conf /srv/svn/conf
yes | cp /vagrant/conf/passwd /srv/svn/conf
# svnserve -d -r /srv/svn
#curl http://localhost:3690
#svn import ~/Documents/my-first-project svn://myserver:3690/my-first-project -m "Initial commit." --username robert --password hunter2
#svn import . svn://localhost:3690/my-first-project -m "Initial commit." --username nuh --password nuh
# cp /vagrant/scripts/mySvn*.sh /usr/bin
# chmod +x /usr/bin/mySvnServerSt*
# cp /vagrant/scripts/mySvnServer.service /etc/systemd/system
# systemctl daemon-reload
# systemctl start mySvnServer
# systemctl enable mySvnServer
cp /vagrant/scripts/svnserve /etc/default
cp /vagrant/scripts/svnserve.service /etc/systemd/system
systemctl start svnserve
systemctl enable svnserve