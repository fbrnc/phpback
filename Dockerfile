FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get install -y lamp-server^
RUN \
  a2enmod rewrite && \
  sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

CMD service apache2 start && service mysql start && tail -F /var/log/apache2/access.log

# docker build -t fbrnc/phpback:v8 .
# docker run -it -v (pwd)/:/var/www/html -p 80:80 fbrnc/phpback:v8
# docker run --name phpback -d -v (pwd)/:/var/www/html -p 80:80 fbrnc/phpback:v8
