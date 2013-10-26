FROM ubuntu

MAINTAINER Jesse Howarth <him@jessehowarth.com>

# Long lines to reduce layer count and size.

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && apt-get update && apt-get upgrade -y
RUN apt-get install -y python-software-properties && add-apt-repository ppa:webupd8team/java -y && apt-get update && echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && apt-get install -y oracle-java7-installer

RUN wget http://hivelocity.dl.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.0.7-bin.tar.gz && tar xvf liquibase-3.0.7-bin.tar.gz liquibase.jar && rm -rf liquibase-3.0.7-bin.tar.gz
RUN mkdir /drivers/ && wget -O /drivers/postgresql-9.2-1003.jdbc4.jar http://jdbc.postgresql.org/download/postgresql-9.2-1003.jdbc4.jar

ENTRYPOINT ["java", "-jar", "liquibase.jar"]
