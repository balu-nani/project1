FROM ubuntu
RUN apt update -y
RUN apt-get install openjdk-8-jdk -y
RUN apt install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
RUN tar -zxvf apache-tomcat-9.0.65.tar.gz
RUN rm -rf apache-tomcat-9.0.65.tar.gz
RUN mv apache-tomcat-9.0.65/ tomcat
COPY ./target/petclinic.war /tomcat/webapps/
CMD ["/tomcat/bin/catalina.sh","run"]
