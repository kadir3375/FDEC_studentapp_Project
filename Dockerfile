FROM centos:7
RUN yum install epel-release -y
RUN yum install java-openjdk -y
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.93/bin/apache-tomcat-8.5.93.tar.gz /opt
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar lib/
WORKDIR /opt
RUN tar -xzf apache-tomcat-8.5.93.tar.gz -C /opt
WORKDIR /opt/apache-tomcat-8.5.93
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war webapps/
COPY context.xml conf/context.xml
EXPOSE 8081
CMD ./bin/catalina.sh run                
