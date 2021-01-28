FROM ubuntu:latest
RUN sudo apt-get ipdate
ENTRYPOINT ["echo", "hello"]
