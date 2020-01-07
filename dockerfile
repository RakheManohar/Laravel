FROM ubuntu
ENV DEBIAN_FRONTEND="nonintractive"
COPY . /usr/src/app
WORKDIR /usr/src/app/notejam
RUN apt-get update -yq && apt-get install php7.2-cli -yq && apt-get install curl -yq && apt-get install openssl zip php-zip unzip git -yq
RUN curl -s https://getcomposer.org/installer | php && php composer.phar install --ignore-platform-reqs
RUN touch app/database/notejam.db && php artisan migrate 
ENTRYPOINT php artisan serve

