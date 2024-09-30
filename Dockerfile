FROM ubuntu:20.04
RUN apt update
RUN apt install tomcat9 -y
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
CMD ["catalina.sh", "run"]
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
WORKDIR /home
RUN git clone "https://github.com/boxfuse/boxfuse-sample-java-war-hello.git"
WORKDIR /home/boxfuse-sample-java-war-hello
RUN mvn package
RUN /bin/sh -c /bin/sh -c cp /home/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
