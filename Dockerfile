FROM debian:latest

RUN apt-get update &&  apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
    python3 python3-pip python2.7 python-pip python3.4 python3.5 python 3.6 git


COPY requirements.txt /source/

RUN pip3 install --ignore-installed -r /source/requirements.txt
RUN pip install --ignore-installed -r /source/requirements.txt

COPY . /source
WORKDIR /source

RUN make fresh # test
RUN ./run-tests.sh

