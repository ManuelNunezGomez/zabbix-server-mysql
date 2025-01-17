FROM zabbix/zabbix-server-mysql:ubuntu-5.4.5

LABEL maintainer="mr.lioncub" \
      link1="https://github.com/zabbix/zabbix-docker/tree/6.0/server-mysql/alpine" \
      link2="https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server"

USER root

RUN set -x \
  && tempDir="$(mktemp -d)" \
  && chown nobody:nobody $tempDir \
  && cd $tempDir \
  && wget "https://download.microsoft.com/download/b/9/f/b9f3cce4-3925-46d4-9f46-da08869c6486/msodbcsql18_18.0.1.1-1_amd64.apk" \
  && wget "https://download.microsoft.com/download/b/9/f/b9f3cce4-3925-46d4-9f46-da08869c6486/mssql-tools18_18.0.1.1-1_amd64.apk" \
  && apk add --allow-untrusted msodbcsql18_18.0.1.1-1_amd64.apk \
  && apk add --allow-untrusted mssql-tools18_18.0.1.1-1_amd64.apk \
  && apk add coreutils \
  && rm -rf $tempDir \
  && rm -rf /var/cache/apk/*

USER 1997
