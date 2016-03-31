#open tomcat 8; 

FROM index.alauda.cn/openadmin/sys_java

#---------------tomcat--------------------------
RUN mkdir /data/server/tomcat
RUN wget -P /data/server/tomcat http://f.open.com.cn/S/shell/tomcat/apache-tomcat-8.0.32.tar.gz
RUN tar -zxvf /data/server/tomcat/apache-tomcat-8.0.32.tar.gz -C /data/server/tomcat/
RUN ln -s /data/server/tomcat/apache-tomcat-8.0.32 /data/server/tomcat/default
RUN rm -f /data/server/tomcat/apache-tomcat-8.0.32.tar.gz

ENV CATALINA_HOME=/data/server/tomcat/default
RUN  chmod 777 /data/server/tomcat/default/bin/*.sh
RUN echo "CATALINA_HOME=/data/server/tomcat/default" >> /etc/profile

WORKDIR /data/server/tomcat/default
EXPOSE 8080

#CMD ["sh","/data/server/tomcat/default/bin/startup.sh"]
#why why
CMD ["/data/server/tomcat/default/bin/catalina.sh","run"]