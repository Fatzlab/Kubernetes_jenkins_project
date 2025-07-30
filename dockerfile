

FROM centos:7

MAINTAINER fz.fatimazohraa@gmail.com

RUN yum install -y httpd \
    zip \
    unzip

ADD https://www.dropbox.com/scl/fi/79s8t91encamiy3ytfl1a/pictures.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip pictures.zip

RUN cp -rf pictures/* .

RUN rm -rf pictures pictures.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 443 

