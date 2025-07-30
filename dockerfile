FROM centos:7

LABEL maintainer="fz.fatimazohraa@gmail.com"

RUN sed -i 's|mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo

RUN yum clean all && yum -y update && yum -y install httpd wget && yum clean all

ADD https://cdn-employer-wp.arc.dev/wp-content/uploads/2022/04/good-software-developer-1128x635.jpg /var/www/html/

WORKDIR /var/www/html/

EXPOSE 80 443

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
