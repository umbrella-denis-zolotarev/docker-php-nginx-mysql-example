FROM nginx as nginx-container-image

RUN rm -rf /srv
RUN mkdir -p /srv/public
COPY --from=php-container-image /srv/public /srv/public

COPY ./default.conf /etc/nginx/conf.d/default.conf
