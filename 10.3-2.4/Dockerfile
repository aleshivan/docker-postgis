FROM postgres:10.3
MAINTAINER Mike Dillon <mike@appropriate.io>

ENV POSTGIS_MAJOR 2.4
ENV POSTGIS_VERSION 2.4.3+dfsg-2.pgdg90+1
ENV POSTGRES_CONF /var/lib/postgresql/data/postgresql.conf

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION 

RUN apt-get install -y software-properties-common \
      && add-apt-repository -y ppa:timescale/timescaledb-ppa \
      && apt-get update \
      && apt-get install -y --allow-unauthenticated timescaledb-postgresql-10 \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./update-postgis.sh /usr/local/bin
COPY ./init-timescale.sh /usr/local/bin
