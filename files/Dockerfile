FROM debian:trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl git jq \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN VER=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r ".tag_name[1:]") \
    && echo $VER 
RUN VER=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | jq -r ".tag_name[1:]") \
    && curl -sL -o /hugo.deb "https://github.com/gohugoio/hugo/releases/download/v${VER}/hugo_extended_${VER}_linux-amd64.deb"
RUN dpkg -i /hugo.deb
RUN rm /hugo.deb

RUN VER=$(curl -s https://go.dev/dl/ | grep -m1 -o 'go[0-9]\+\.[0-9]\+\.[0-9]\+\.linux-amd64\.tar\.gz') \
    && curl -sL -o /go.tar.gz "https://go.dev/dl/${VER}" \
    && tar -C /usr/local -xzf /go.tar.gz \
    && rm /go.tar.gz

WORKDIR /
RUN mkdir /public

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
