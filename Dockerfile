FROM postgres:18.1-trixie

ARG UID
ARG GID

USER root
RUN adduser postgres --system
RUN usermod -u $UID postgres && \
    groupmod -g $GID postgres

USER postgres
#COPY ./init-db.sh /docker-entrypoint-initdb.d/init-db.sh
