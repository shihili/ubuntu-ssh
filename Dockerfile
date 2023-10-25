FROM ubuntu:20.04

RUN apt update

RUN apt install openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 nino 

RUN usermod -aG sudo nino

RUN service ssh start

RUN  echo 'nino:nino' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
