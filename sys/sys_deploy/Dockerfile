# BUILD IN
# git subversion maven gradle ant

FROM index.alauda.cn/openadmin/sys_java

RUN mkdir -p /data/app/code/
RUN mkdir -p /data/app/build/
RUN mkdir -p /data/app/deploy/

RUN yum install -y wget unzip subversion git maven zip

ENV APP_CODE=/data/app/code/
ENV APP_BUILD=/data/app/build/
ENV APP_DEPLOY=/data/app/deploy/
RUN echo "APP_CODE=/data/app/code/ " >> /etc/profile
RUN echo "APP_BUILD=/data/app/build/ " >> /etc/profile
RUN echo "APP_DEPLOY=/data/app/deploy/ " >> /etc/profile


WORKDIR /data/app/deploy/



#---------------ant--------------------------
RUN mkdir /data/server/ant
RUN wget -P /data/server/ant http://f.open.com.cn/S/shell/ant/apache-ant-1.9.4-bin.tar.gz
RUN tar -zxvf /data/server/ant/apache-ant-1.9.4-bin.tar.gz -C /data/server/ant/
RUN ln -s /data/server/ant/apache-ant-1.9.4 /data/server/ant/default
RUN wget -P /data/server/ant/default/lib http://f.open.com.cn/S/shell/ant/ant-contrib-1.0b3.jar

ENV ANT_HOME=/data/server/ant/default
RUN echo "ANT_HOME=/data/server/ant/default " >> /etc/profile
ENV PATH=$PATH:$ANT_HOME/bin
RUN echo "PATH=$PATH:$ANT_HOME/bin" >> /etc/profile

#RUN  chmod 777 $ANT_HOME/bin/*.sh

RUN echo "****************************** ANT DONE ****************"
#---------------ant--------------------------



#---------------gradle--------------------------
RUN mkdir /data/server/gradle
RUN wget -P /data/server/gradle http://f.open.com.cn/S/shell/gradle/gradle-2.5-all.zip
RUN unzip /data/server/gradle/gradle-2.5-all.zip -d /data/server/gradle/
RUN ln -s /data/server/gradle/gradle-2.5 /data/server/gradle/default


ENV GRADLE_HOME=/data/server/gradle/default
RUN echo "GRADLE_HOME=/data/server/gradle/default " >> /etc/profile
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN echo "PATH=$PATH:$GRADLE_HOME/bin" >> /etc/profile
RUN source /etc/profile

RUN chmod 777 $GRADLE_HOME/bin/*

RUN ant -version
RUN gradle --version
RUN mvn --version
RUN git --version
RUN svn --version

RUN echo "****************************** gradle DONE ****************"
#---------------gradle--------------------------


