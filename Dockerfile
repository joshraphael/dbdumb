FROM ubuntu:18.04
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y python3 python3-virtualenv python3-pip libmysqlclient-dev wget alien libaio1 sqlite3 libssl-dev libffi-dev

RUN mkdir /dbdumb

RUN wget https://download.oracle.com/otn_software/linux/instantclient/193000/oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm -O /dbdumb/instantclient.rpm
RUN alien -i /dbdumb/instantclient.rpm
RUN rm /dbdumb/instantclient.rpm

COPY . /dbdumb
WORKDIR /dbdumb

RUN python3 -m virtualenv --python=/usr/bin/python3 env
RUN . env/bin/activate
RUN pip3 install -r requirements.txt