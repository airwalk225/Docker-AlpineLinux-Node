FROM alpine:3.6

##Push the edge repo into the package manager
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories

#Make sure the apk is up to date
RUN apk update && apk upgrade

#Install libuv from the edge repo, need this for node to work
RUN apk add --no-cache libuv@edge && \
    #Install the current nodejs and npm
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community nodejs-current-npm && \
    #Install some ease of use packages
    apk add bash \
            curl \
            vim && \
            #REmove the cache
            rm -rf /var/cache/apk/*

CMD [ "/bin/sh" ]
