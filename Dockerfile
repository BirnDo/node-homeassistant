FROM node:alpine

ENV LANG C.UTF-8

ADD package.json /

RUN apk add --no-cache nodejs-npm jq && \
npm install gulp -g && \
npm install

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]