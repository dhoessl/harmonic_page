FROM debian:trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl git jq \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r ".tag_name[1:]" > /hugo.version
RUN curl -s "https://go.dev/VERSION?m=text" | head -n1  > /go.version

RUN curl -sL -o /hugo.deb "https://github.com/gohugoio/hugo/releases/download/v`cat /hugo.version`/hugo_extended_`cat hug.version`_linux-amd64.deb"
RUN dpkg -i /hugo.deb
RUN rm /hugo.deb /hugo.version

RUN curl -sL -o /go.tar.gz "https://go.dev/dl/`cat /go.version`.linux-amd64.tar.gz" \
    && tar -C /usr/local -xzf /go.tar.gz \
    && rm /go.tar.gz /go.version

WORKDIR /
RUN mkdir /public

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
