###installation
###<pre>
###cd /home
###git clone https://github.com/786khk/project_upload.git
###cd project_upload
###</pre>

###RUN
###<pre>
###Login For Private Docker Repository
###docker login
###docker pull 786khk/project_upload
###docker run -p 8080:8080 -v --name tom8 /home/project_upload/

FROM ubuntu:latest
MAINTAINER 786khk@naver.com
RUN apt-get -y update

# java1.8
FROM openjdk:8	
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac TestMain.java
CMD ["java", "TestMain"]
