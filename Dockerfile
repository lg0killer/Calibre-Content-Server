FROM ubuntu

RUN apt-get update -y \
  && apt-get install -y calibre \
  && apt-get clean \
  && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

EXPOSE 8080

RUN mkdir -p /data

VOLUME ["/data"]
ENTRYPOINT ["/usr/bin/calibre-server", "/data"]
