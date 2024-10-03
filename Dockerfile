FROM thonatos/openjdk-tomcat-maven:jdk8-maven3
RUN apk update
RUN apk add git
WORKDIR /home
RUN git clone "https://github.com/boxfuse/boxfuse-sample-java-war-hello.git"
WORKDIR /home/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /home/boxfuse-sample-java-war-hello/target/hello-1.0.war /opt/tomcat/webapps/
CMD ["/var/lib/tomcat8/bin/catalina.sh", "run"]
EXPOSE 8080
