FROM noman12/atrociousmirror:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY bhvs.txt .
RUN pip3 install --no-cache-dir -r bhvs.txt
RUN apt -qq update --fix-missing && \
    apt -qq install -y mediainfo

RUN apt-get -y clean
RUN apt-get -y autoremove

COPY . .


CMD ["bash", "start.sh"]
