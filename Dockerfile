ARG DEBIAN_VERSION=bullseye-slim
ARG BASEDEV_VERSION=v0.25.0

FROM debian:$DEBIAN_VERSION AS chktex
ARG CHKTEX_VERSION=1.7.6
WORKDIR /tmp/workdir
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends g++ make wget
RUN echo $CHKTEX_VERSION
RUN wget -qO- http://download.savannah.gnu.org/releases/chktex/chktex-$CHKTEX_VERSION.tar.gz | \
    tar -xz --strip-components=1
RUN ./configure && \
    make && \
    mv chktex /tmp && \
    rm -r *
