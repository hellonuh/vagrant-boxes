#!/usr/bin/env bash
echo "provisioning the box"
yum install -y glibc make binutils gcc libaio bc initscripts net-tools openssl
rpm -ivh  /vagrant/software/oracle-xe-11.2.0-1.0.x86_64.rpm > /tmp/XEsilentinstall.log
/etc/init.d/oracle-xe configure responseFile=/vagrant/software/xe.rsp >> /tmp/XEsilentinstall.log
echo "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe" >> .bash_profile
echo "export ORACLE_SID=XE" >> .bash_profile
echo "export NLS_LANG=`\$ORACLE_HOME/bin/nls_lang.sh`" >> .bash_profile
echo "export PATH=\$ORACLE_HOME/bin:\$PATH" >> .bash_profile
yum clean all
echo "All done"
