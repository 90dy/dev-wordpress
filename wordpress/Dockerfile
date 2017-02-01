FROM ubuntu:xenial

VOLUME /backup
VOLUME /usr/share/wordpress
EXPOSE 80

RUN apt-get update

RUN { \
		echo 'mysql-server mysql-server/root_password password cprt87'; \
		echo 'mysql-server mysql-server/root_password_again password cprt87'; \
	} | debconf-set-selections

RUN apt-get install -y apache2 \
	php \
	php-mysql \
	libapache2-mod-php \
	mysql-server \
	vsftpd \
	wget

COPY apache2/wordpress.conf /etc/apache2/sites-available/wordpress.conf
RUN service apache2 start \
	&& a2ensite wordpress \
	&& a2dissite 000-default \
	&& a2enmod rewrite \
	&& service apache2 restart

COPY mysql/wordpress.sql /tmp/wordpress.sql
RUN service mysql start \
	&& mysql --user=root --password=cprt87 < /tmp/wordpress.sql \
	&& service mysql restart

CMD service apache2 start; \
 	service mysql start; \
	service vsftpd start; \
	while true; do sleep 1; done
