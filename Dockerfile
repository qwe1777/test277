FROM thonatos/openjdk-tomcat-maven:jdk8-maven3
RUN echo y | apk add git
WORKDIR /home
RUN git clone "https://github.com/boxfuse/boxfuse-sample-java-war-hello.git"
WORKDIR /home/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat8/webapps/
CMD ["/var/lib/tomcat8/bin/catalina.sh", "run"]
EXPOSE 8080
