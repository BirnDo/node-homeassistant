FROM node:alpine

ENV LANG C.UTF-8

ADD package.json /

# Copy data for add-on
COPY run.sh /
COPY app.ts /
COPY routes/index.ts /routes/
COPY API-service.ts /
COPY tsconfig.json /
COPY package.json /
COPY package-lock.json /

EXPOSE 3000

RUN chmod a+x /run.sh

ENTRYPOINT ["sh","/run.sh"]
