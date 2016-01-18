FROM		ubuntu:14.04
MAINTAINER	Alexandre Buisine <alexandrejabuisine@gmail.com>
LABEL		version="1.0.0"

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && apt-get install -yqq \
 	dnsmasq \
 	dnsutils \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo "addn-hosts=/config/althosts" >> /etc/dnsmasq.conf
RUN echo "user=root" >> /etc/dnsmasq.conf

EXPOSE 53

CMD ["/usr/sbin/dnsmasq","-d"]