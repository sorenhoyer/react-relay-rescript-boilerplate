FROM node:14

RUN echo 'deb http://deb.debian.org/debian stable main' >> /etc/apt/sources.list

RUN apt update -y

RUN apt install -y curl build-essential supervisor wget libstdc++6

RUN apt upgrade -y

# RUN apt-get dist-upgrade

RUN gcc --version

ENV WATCHMAN_VERSION=2020.09.14.00

WORKDIR /tmp

RUN curl -LO https://github.com/facebook/watchman/releases/download/v${WATCHMAN_VERSION}/watchman-v${WATCHMAN_VERSION}-linux.zip

RUN unzip watchman-v${WATCHMAN_VERSION}-linux.zip

RUN rm watchman-v${WATCHMAN_VERSION}-linux.zip

RUN mkdir -p /usr/local/{bin,lib} /usr/local/var/run/watchman

RUN cp /tmp/watchman-v${WATCHMAN_VERSION}-linux/bin/* /usr/local/bin

RUN cp /tmp/watchman-v${WATCHMAN_VERSION}-linux/lib/* /usr/local/lib

RUN chmod 755 /usr/local/bin/watchman

RUN chmod 2777 /usr/local/var/run/watchman

RUN watchman --version

WORKDIR /client

ENV PATH /client/node_modules/.bin:$PATH

COPY reason-relay.tgz ./

COPY package.json ./

COPY yarn* ./

RUN dir

RUN npm i -g yarn --force

RUN yarn

RUN yarn update-schema

COPY relay.config.js ./

COPY . ./

CMD ["yarn", "start"]
