FROM cytopia/php-cs-fixer:3-php7.4

COPY entrypoint.sh \
     /action/

RUN chmod +x /action/entrypoint.sh

RUN apk update && \
    apk upgrade && \
    apk add git

ENTRYPOINT ["/action/entrypoint.sh"]
