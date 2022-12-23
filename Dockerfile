FROM php:7.4-alpine

RUN wget https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.5.6/phpcs.phar -O phpcs \
    && chmod a+x phpcs \
    && mv phpcs /usr/local/bin/phpcs

RUN wget https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.7.1/phpcbf.phar -O phpcbf \
    && chmod a+x phpcbf \
    && mv phpcbf /usr/local/bin/phpcbf

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /action/entrypoint.sh

RUN apk update && \
    apk upgrade && \
    apk add git

ENTRYPOINT ["/entrypoint.sh"]
