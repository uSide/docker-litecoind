FROM debian:stable-slim

ENV LITECOIN_VERSION=0.16.3
ENV LITECOIN_CHECKSUM=686d99d1746528648c2c54a1363d046436fd172beadaceea80bdc93043805994

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && sha256sum litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${LITECOIN_CHECKSUM} litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp litecoin-${LITECOIN_VERSION}/bin/litecoind /usr/local/bin \
    && rm -rf litecoin-${LITECOIN_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/litecoind"]
