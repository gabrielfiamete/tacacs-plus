# start with Alpine Linux
FROM alpine:latest

RUN apk add --no-cache \
        build-base \
        c-ares-dev \
        curl \
        curl-dev \
        freeradius-client-dev \
        libretls-dev \
        linux-pam-dev \
        openssl-dev \
        pcre2-dev \
        perl \
        perl-authen-radius \
        perl-ldap \
        perl-net-ip \
        perl-sys-syslog 

RUN wget https://github.com/MarcJHuber/event-driven-servers/archive/refs/heads/master.zip -O event-driven-servers-master.zip && \
    unzip event-driven-servers-master.zip && \
    cd event-driven-servers-master && \
    ./configure && \
    make && \
    make install

COPY ./etc/tac_simple.cfg /usr/local/etc/tac_plus-ng.cfg

EXPOSE 49

CMD ["/usr/local/sbin/tac_plus-ng", "/usr/local/etc/tac_plus-ng.cfg"]
