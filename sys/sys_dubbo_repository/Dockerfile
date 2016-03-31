
# Dubboreb

FROM index.alauda.cn/openadmin/sys_tomcat

ENV JAVA_HOME=$JAVA_7_HOME
RUN echo "JAVA_HOME=$JAVA_7_HOME" >> /etc/profile
ENV CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
RUN echo "CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile
ENV PATH=$SOURCEPATH:$JAVA_HOME/bin
RUN echo "PATH=$SOURCEPATH:$JAVA_HOME/bin" >> /etc/profile

#------------------------zookeeper------------------------
RUN mkdir -p /data/server/zookeeper
RUN mkdir -p /data/server/zookeeper/data
RUN mkdir -p /data/log/zk


RUN wget -P /data/server/zookeeper http://apache.fayea.com/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz
RUN tar -zxvf /data/server/zookeeper/zookeeper-3.4.8.tar.gz -C /data/server/zookeeper/
RUN rm -rf /data/server/zookeeper/zookeeper-3.4.8.tar.gz

RUN ln -s /data/server/zookeeper/zookeeper-3.4.8 /data/server/zookeeper/default


ENV ZOOKEEPER_HOME=/data/server/zookeeper/default
RUN echo "ZOOKEEPER_HOME=/data/server/zookeeper/default " >> /etc/profile
ENV PATH=$PATH:$ZOOKEEPER_HOME/bin
RUN echo "PATH=$PATH:$ZOOKEEPER_HOME/bin" >> /etc/profile

#RUN  chmod 777 $ZOOKEEPER_HOME/bin/*.sh

COPY zoo.cfg /data/server/zookeeper/default/conf/
COPY myid /data/server/zookeeper/data/


#------------------------zookeeper------------------------


#------------------------dubbo------------------------
RUN rm -rf /data/server/tomcat/default/webapps/
RUN wget -P /data/server/tomcat/default/webapps/ http://f.open.com.cn/S/shell/dubbo/dubbo-admin-2.5.4.war
RUN mv /data/server/tomcat/default/webapps/dubbo-admin-2.5.4.war /data/server/tomcat/default/webapps/ROOT.war
#------------------------dubbo------------------------



#
RUN yum -y install openssh-server
RUN echo -e "ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && echo \"root:hackme\" | chpasswd && && /usr/sbin/sshd -D" > /data/shell/bootstrap.sh

WORKDIR /data/server/tomcat/default

EXPOSE 80 2181 22


COPY run.sh /data/shell/
RUN  chmod 777 /data/shell/*

#CMD ["sh","/data/server/zookeeper/default/bin/zkServer.sh start"]
#CMD ["sh","/data/server/tomcat/default/bin/startup.sh"]
#CMD ["/data/server/tomcat/default/bin/catalina.sh","run"]
#CMD ["sh","/data/shell/run.sh"]
CMD /data/shell/run.sh
