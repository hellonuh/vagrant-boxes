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
#end
echo "done"