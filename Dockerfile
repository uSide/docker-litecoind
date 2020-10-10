FROM debian:stable-slim

ENV LITECOIN_VERSION=0.18.1
ENV LITECOIN_CHECKSUM=ca50936299e2c5a66b954c266dcaaeef9e91b2f5307069b9894048acf3eb5751

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${LITECOIN_CHECKSUM} litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp litecoin-${LITECOIN_VERSION}/bin/litecoind /usr/local/bin \
    && rm -rf litecoin-${LITECOIN_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/litecoind"]
