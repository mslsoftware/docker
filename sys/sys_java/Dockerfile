# open java 8;

FROM index.alauda.cn/openadmin/sys_centos


RUN yum install -y wget unzip

ENV SOURCEPATH=$PATH
RUN echo "SOURCEPATH=$PATH" >> /etc/profile

#---------------java env--------------------------
RUN mkdir /data/server/java

RUN wget -P /data/server/java http://f.open.com.cn/S/shell/java/jdk-8u73-linux-x64.tar.gz
RUN tar -zxvf /data/server/java/jdk-8u73-linux-x64.tar.gz -C /data/server/java/
RUN rm -f /data/server/java/jdk-8u73-linux-x64.tar.gz 
ENV JAVA_8_HOME=/data/server/java/jdk1.8.0_73
RUN alias jdk8='export JAVA_HOME=$JAVA_8_HOME'
RUN echo "JAVA_8_HOME=/data/server/java/jdk1.8.0_73" >> /etc/profile
RUN echo "alias jdk8='export JAVA_HOME=$JAVA_8_HOME;export CLASSPATH=$JAVA_8_HOME/lib/dt.jar:$JAVA_8_HOME/lib/tools.jar;export PATH=$SOURCEPATH:$JAVA_8_HOME/bin'" >> /etc/profile

RUN wget -P /data/server/java http://f.open.com.cn/S/shell/java/jdk-7u75-linux-x64.gz
RUN tar -zxvf /data/server/java/jdk-7u75-linux-x64.gz -C /data/server/java/
RUN rm -f /data/server/java/jdk-7u75-linux-x64.gz 
ENV JAVA_7_HOME=/data/server/java/jdk1.7.0_75
RUN alias jdk7='export JAVA_HOME=$JAVA_7_HOME'
RUN echo "JAVA_7_HOME=/data/server/java/jdk1.7.0_75" >> /etc/profile
RUN echo "alias jdk7='export JAVA_HOME=$JAVA_7_HOME;export CLASSPATH=$JAVA_7_HOME/lib/dt.jar:$JAVA_7_HOME/lib/tools.jar;export PATH=$SOURCEPATH:$JAVA_7_HOME/bin'" >> /etc/profile

RUN wget -P /data/server/java http://f.open.com.cn/S/shell/java/jdk-6u45-linux-x64-rpm.bin
RUN chmod 777 /data/server/java/jdk-6u45-linux-x64-rpm.bin
WORKDIR /data/server/java
RUN ./jdk-6u45-linux-x64-rpm.bin
RUN rm -f /data/server/java/jdk-6u45-linux-x64-rpm.bin 
ENV JAVA_6_HOME=/usr/java/default
RUN alias jdk6='export JAVA_HOME=$JAVA_6_HOME'
RUN echo "JAVA_6_HOME=/usr/java/default" >> /etc/profile
RUN echo "alias jdk6='export JAVA_HOME=$JAVA_6_HOME;export CLASSPATH=$JAVA_6_HOME/lib/dt.jar:$JAVA_6_HOME/lib/tools.jar;export PATH=$SOURCEPATH:$JAVA_6_HOME/bin'" >> /etc/profile
RUN rm -f /usr/bin/java 

ENV JAVA_HOME=$JAVA_8_HOME
RUN echo "JAVA_HOME=$JAVA_8_HOME" >> /etc/profile

RUN ln -s $JAVA_HOME /data/server/java/default

ENV CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
RUN echo "CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile

ENV PATH=$SOURCEPATH:$JAVA_HOME/bin
RUN echo "PATH=$SOURCEPATH:$JAVA_HOME/bin" >> /etc/profile

RUN source /etc/profile

RUN java -version

RUN echo "****************************** JAVA DONE. ****************"
#---------------java env--------------------------



CMD ["/bin/bash"]