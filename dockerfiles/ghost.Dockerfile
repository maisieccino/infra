ARG GHOST_VERSION=3.31.5
FROM ghost:${GHOST_VERSION}-alpine

RUN mkdir -p ./content/adapters/storage
RUN cd current && npm install ghost-digitalocean
RUN cp -r current/node_modules/ghost-digitalocean content/content-adapters/storage/digitalocean
