#!/bin/sh

TIMESCALE="shared_preload_libraries = 'timescaledb'"
POST_CONF=/var/lib/postgresql/data/postgresql.conf

if grep -q $TIMESCALE $POST_CONF; then
    echo "is configured, only reload"
else
    echo "add configuration, do reload"
    echo '#' >> $POST_CONF
    echo $TIMESCALE >> $POST_CONF
fi

su - postgres -c '/usr/lib/postgresql/10/bin/pg_ctl reload -D /var/lib/postgresql/data'

