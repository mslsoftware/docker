#!/bin/bash

echo "fguo test 111222"

echo $JAVA_HOME

sh /data/server/zookeeper/default/bin/zkServer.sh start

echo "zookeeper start done."

/data/server/tomcat/default/bin/catalina.sh run


echo "sshd start begin----------------."
/data/shell/bootstrap.sh
echo "sshd start end----------------."


echo "dubbo start done."



