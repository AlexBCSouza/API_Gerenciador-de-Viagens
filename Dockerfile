FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:webupd8team/java
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install oracle-java8-installer -y
RUN apt-get install maven -y
RUN apt-get install git -y

RUN mkdir /data
RUN git clone https://github.com/AntonioMontanha/gerenciador-viagens.git /data/gerenciador-viagens

EXPOSE 8089

CMD /data/gerenciador-viagens/start-app.sh
