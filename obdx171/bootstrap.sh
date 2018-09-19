#!/usr/bin/env bash
# set env variables in bash profile
echo "
export ORACLE_HOME=/home/vagrant
export JAVA_HOME=/usr/java/default
export USER_MEM_ARGS=\"-Djava.security.egd=file:/dev/./urandom\"
export PATH=\$PATH:/usr/java/default/bin:/home/vagrant/oracle_common/common/bin:/home/vagrant/wlserver/common/bin" >> .bash_profile
# set env variables for current session
export ORACLE_HOME=/home/vagrant
export JAVA_HOME=/usr/java/default
export USER_MEM_ARGS="-Djava.security.egd=file:/dev/./urandom"
export PATH=$PATH:/usr/java/default/bin:/home/vagrant/oracle_common/common/bin:/home/vagrant/wlserver/common/bin
# install java
rpm -ivh /vagrant/software/jdk-8u101-linux-x64.rpm
# install wls
su -c "/usr/java/default/bin/java -jar /vagrant/software/fmw_12.2.1.2.0_wls.jar -ignoreSysPrereqs -novalidation -silent -responseFile /vagrant/software/rsp/install.file -invPtrLoc /vagrant/software/rsp/oraInst.loc -jreLoc /usr/java/default ORACLE_HOME=/home/vagrant" vagrant
# install infrastructure
su -c "/usr/java/default/bin/java -jar /vagrant/software/fmw_12.2.1.2.0_infrastructure.jar -ignoreSysPrereqs -novalidation -silent -responseFile /vagrant/software/rsp/infra.file -invPtrLoc /vagrant/software/rsp/oraInst.loc -jreLoc /usr/java/default ORACLE_HOME=/home/vagrant" vagrant
# install extra components
# install urwid
cp /vagrant/software/urwid-1.3.1.tar.gz .
tar -zxvf urwid-1.3.1.tar.gz && cd urwid-1.3.1 && python setup.py build_py && python setup.py install
cd /home/vagrant && rm -rf urwid-1.3.1
# install cx_Oracle
rpm -ivh /vagrant/software/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
rpm -ivh /vagrant/software/cx_Oracle-5.2.1-12c-py27-1.x86_64.rpm
#end
echo "done"