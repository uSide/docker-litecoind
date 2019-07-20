FROM debian:stable-slim

ENV LITECOIN_VERSION=0.17.1
ENV LITECOIN_CHECKSUM=9cab11ba75ea4fb64474d4fea5c5b6851f9a25fe9b1d4f7fc9c12b9f190fed07

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${LITECOIN_CHECKSUM} litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp litecoin-${LITECOIN_VERSION}/bin/litecoind /usr/local/bin \
    && rm -rf litecoin-${LITECOIN_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/litecoind"]
