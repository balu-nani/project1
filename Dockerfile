FROM ubuntu

WORKDIR /opt
RUN apt-get update -y && apt-get install wget -y && apt-get install curl -y && apt-get install fontconfig -y

RUN wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u282-b08/OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
RUN tar -zxvf OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
RUN rm -rf OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz
RUN mv jdk8u282-b08 java8

RUN sed -i '$a export JAVA_HOME=/opt/java8' /etc/profile && sed -i '$a export PATH=$PATH:/opt/java8/bin' /etc/profile

RUN apt-get install vim -y
RUN apt-get install maven -y

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
RUN tar -zxvf apache-tomcat-9.0.65.tar.gz
RUN mv apache-tomcat-9.0.65 tomcat
RUN rm -rf apache-tomcat-9.0.65.tar.gz

WORKDIR /opt/tomcat/webapps
COPY ./target/petclinic.war /opt/tomcat/webapps

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
