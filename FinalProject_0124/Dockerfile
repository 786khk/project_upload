#FROM어떤 이미지를 기반으로 할지 이미지이름 :태그
FROM  ubuntu:latest 
#MAINTAINER 786khk@naver.com
#셸 스크립트 또는 명령어 실행
RUN apt-get update -y
RUN apt-get install wget
#CMD 도커실행시 가장 많이 쓰임, 여러개일경우 가장 마지막꺼실행
#CMD ["tomcat", "--bind", "0.0.0.0:8000", "example.wsgi:application"]
                    
git clone https://github.com/786khk/project_upload.git

## Install packages  copy와 마찬가지로 add는 압축파일이 있을 경우 자동으로 압축해제하면서 복사.
ADD ./usr/src               
RUN pip install -r requirements.txt    

## Copy all src files 
COPY /var/lib/tomcatCopy.txt                              

## Run the application on the port 8080 
EXPOSE 8080        

#이미지를 실행할 경로
WORKDIR /usr/local/
#CMD ["python", "./setup.py", "runserver", "--host=0.0.0.0", "-p 8080"] 
CMD ["tomcat", "--bind", "0.0.0.0:8000", "example.wsgi:application"]
