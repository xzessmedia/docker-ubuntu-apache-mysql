FROM xzesstence/docker-ubuntu-apache
MAINTAINER Tim Koepsel <xzesstence@gmail.com>

# Setup ENV
ENV MYSQL_USER=mysql \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql

# Install MySQL
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

EXPOSE 3306/tcp
VOLUME ["${MYSQL_DATA_DIR}", "${MYSQL_RUN_DIR}"]

# Copy the entrypoint into the build
COPY entrypoint.sh /root/entrypoint.sh
# Make sure it is executable
RUN chmod +x /root/entrypoint.sh

CMD bash -C '/root/entrypoint.sh';'bash'

#https://hub.docker.com/r/sameersbn/mysql/
