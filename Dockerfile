FROM ubuntu:20.04

ARG SQLA_TAR=sqla17developerlinux.tar.gz

ENV SA_HOME=/opt/sqlanywhere17
ENV PATH=$SA_HOME/bin64:$PATH
ENV LD_LIBRARY_PATH=$SA_HOME/lib64:$LD_LIBRARY_PATH

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
       libaio1 libncurses5 expect unixodbc \
    && rm -rf /var/lib/apt/lists/*

COPY ${SQLA_TAR} /tmp/${SQLA_TAR}
RUN tar -xzf /tmp/${SQLA_TAR}

COPY setup.exp /tmp/setup.exp
RUN expect /tmp/setup.exp

RUN printf '#!/bin/bash\n' > /usr/local/bin/entrypoint.sh && \
    printf 'source %s/bin64/sa_config.sh\n' "$SA_HOME" >> /usr/local/bin/entrypoint.sh && \
    printf 'exec "$@"\n' >> /usr/local/bin/entrypoint.sh && \
    chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 2638

VOLUME ["/db"]

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

