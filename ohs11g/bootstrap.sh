#!/usr/bin/env bash
echo "Lets begin"
# Install jdk and set java home
rpm -ivh /vagrant/software/jdk-8u101-linux-x64.rpm
echo "export JAVA_HOME=/usr/java/default" >> .bash_profile
echo "export ORACLE_HOME=/home/vagrant" >> .bash_profile
echo "export USER_MEM_ARGS=\"-Djava.security.egd=file:/dev/./urandom\"" >> .bash_profile
echo "export PATH=\$PATH:/usr/java/default/bin:/home/vagrant/Oracle_WT1/instances/instance1/bin" >> .bash_profile
# Install dependencies
yum install -y \
unzip tar nfs-utils binutils compat-libcap1 compat-libstdc++ \
gcc gcc-c++ glibc glibc-devel libaio libaio-devel libgcc \
libstdc++ libstdc++-devel ksh make ocfs2-tools sysstat && \
yum clean all
# Install software
mkdir /vagrant/software/ohs
unzip /vagrant/software/ofm_webtier_linux_11.1.1.9.0_64_disk1_1of1.zip -d /vagrant/software/ohs
su -c "cd /vagrant/software/ohs/Disk1 && ./runInstaller -ignoreSysPrereqs -novalidation -silent -responseFile /vagrant/software/rsp/webtier.rsp -invPtrLoc /vagrant/software/rsp/oraInst.loc -jreLoc /usr/java/default" vagrant
# The  below line is a perfect example of bad code
# I have to do it since the above line returns in a different thread
sleep 10m
rm -rf /vagrant/software/ohs
#Done
echo "All done"
