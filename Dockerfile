FROM ubuntu
COPY homework /
COPY config.env /countapp/.env
COPY entrypoint.sh /
RUN apt-get update \
    && apt-get install -y python3 python3-pip libmysqlclient-dev pkg-config mysql-server \
    && pip3 install --no-cache -r /requirements.txt \
    && pip3 install Werkzeug==2.3.6 \
    && ln -sf python3 /usr/bin/python \
    && chmod +x /entrypoint.sh 
EXPOSE 6000
WORKDIR /
ENTRYPOINT [ "/bin/sh", "-c", "/entrypoint.sh" ]
