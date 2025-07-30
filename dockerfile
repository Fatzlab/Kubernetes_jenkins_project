
FROM centos:7

LABEL maintainer="fz.fatimazohraa@gmail.com"

# Install Apache HTTP server
RUN yum -y update && \
    yum install -y httpd && \
    yum clean all

# Add image to Apache root
ADD https://cdn-employer-wp.arc.dev/wp-content/uploads/2022/04/good-software-developer-1128x635.jpg /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
