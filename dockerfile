FROM ubuntu
LABEL org.opencontainers.image.authors="Kędziorek s97633@pollub.edu.pl"
RUN apt update && apt upgrade -y \
  && apt install apache2 -y \
  && mkdir /var/www/gci/ \
  && service apache2 start
COPY index.html /var/www/html/index.html
EXPOSE 8080
ENTRYPOINT ["apachectl","-D","FOREGROUND"]