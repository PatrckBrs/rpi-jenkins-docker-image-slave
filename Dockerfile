# Base image slave to jenkins on RPi
FROM resin/rpi-raspbian:latest

# Update sources && install packages
RUN DEBIAN_FRONTEND=noninteractive ;\
apt-get update && \
apt-get install --assume-yes \
    openssh-server \
    openjdk-8-jre-headless

RUN useradd -m -s /bin/bash jenkins
RUN echo jenkins:jenkins | chpasswd
RUN mkdir -p /var/run/sshd

EXPOSE 22

CMD /usr/sbin/sshd -D
