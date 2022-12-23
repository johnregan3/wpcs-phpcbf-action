FROM cytopia/phpcs:3-php7.4

COPY entrypoint.sh \
     problem-matcher.json \
     /action/

RUN wget https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.5.6/phpcbf.phar -O phpcbf \
    && chmod a+x phpcbf \
    && mv phpcbf /usr/local/bin/phpcbf

RUN chmod +x /action/entrypoint.sh

RUN apk update && \
    apk upgrade && \
    apk add git

ENTRYPOINT ["/action/entrypoint.sh"]
