#!/bin/bash

jdk="jdk1.8.0_181"
tomcat="apache-tomcat-8.5.41"

echo "kill tomcat process"
ps -ef | grep tomcat | grep -v grep | awk '{print $2}' | xargs kill 

cd /root/

echo "download jdk\n"
rm -f ${jdk}.tar.gz
wget https://labex-ali-data.oss-us-west-1.aliyuncs.com/spark-analysis/jdk-8u181-linux-x64.tar.gz -O ${jdk}.tar.gz

echo "download tomcat\n"
rm -f ${tomcat}.tar.gz
wget https://labex-ali-data.oss-us-west-1.aliyuncs.com/jenkins/${tomcat}.tar.gz

echo "install jdk\n"
rm -rf /usr/local/${jdk}
tar -zxf ${jdk}.tar.gz -C /usr/local/

echo "install tomcat\n"
rm -rf /usr/local/${tomcat}
tar -zxf ${tomcat}.tar.gz -C /usr/local/

echo "modify environment variable\n"
sed -i '/JAVA_HOME/d' /etc/profile
echo "export JAVA_HOME=/usr/local/${jdk}" >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH'  >> /etc/profile
source /etc/profile

export JAVA_HOME=/usr/local/${jdk}
export PATH=$JAVE_HOME/bin:$PATH
echo "start tomcat\n"
chmod +x /usr/local/${tomcat}/bin/startup.sh
nohup /usr/local/${tomcat}/bin/startup.sh &

echo "success"
