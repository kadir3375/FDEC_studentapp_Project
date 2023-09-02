FROM centos:7
RUN yum install epel-release -y
RUN yum install java-openjdk -y
RUN sudo chmod 666 /var/run/docker.sock
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.93/bin/apache-tomcat-8.5.93.tar.gz /opt
WORKDIR /opt
RUN tar -xzf apache-tomcat-8.5.93.tar.gz -C /opt
WORKDIR /opt/apache-tomcat-8.5.93
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war webapps/
EXPOSE 8081
CMD ./bin/catalina.sh run                
