FROM debian:buster-slim

RUN apt-get update && apt-get install -y --no-install-recommends
RUN apt-get install -y php
RUN apt-get install -y php-fpm
RUN apt-get install -y php-curl
RUN apt-get install -y php-intl
RUN apt-get install -y php-mbstring
RUN apt-get install -y php-soap 
RUN apt-get install -y php-xml
RUN apt-get install -y php-xmlrpc
RUN apt-get install -y php-zip

CMD ["php-fpm"]