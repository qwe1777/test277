FROM ubuntu:20:04
RUN apt update
RUN apt install tomcat9 -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN cd /home/
RUN git clone "https://github.com/boxfuse/boxfuse-sample-java-war-hello.git"
RUN cd /boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /target/hello-1.0.war var/lib/tomcat/webapps/
EXPOSE 8080
