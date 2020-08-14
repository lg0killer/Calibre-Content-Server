FROM ubuntu

RUN apt-get update -y \
  && apt-get install -y wget python3 xvfb imagemagick \
  && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin \
  && apt-get clean \
  && rm -rf /var/cache/apt/* /var/lib/apt/lists/* \
  && mkdir /books \
  && mkdir /import

EXPOSE 8080

VOLUME ["/books"]
VOLUME ["/import"]
CMD ["/usr/bin/calibre-server", "/books"]
