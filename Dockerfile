FROM gocd/gocd-agent-docker-dind:v19.11.0
MAINTAINER Danilo Sato <dtsato@gmail.com>

USER root

RUN \
  apk add --update make ca-certificates openssl python && \
  update-ca-certificates && \
  wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
  tar zxf google-cloud-sdk.tar.gz && \
  ./google-cloud-sdk/install.sh --usage-reporting=false && \
  ./google-cloud-sdk/bin/gcloud --quiet components update && \
  rm -f google-cloud-sdk.tar.gz

USER go

ENV PATH $PATH:/google-cloud-sdk/bin
