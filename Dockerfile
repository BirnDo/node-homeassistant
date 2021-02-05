FROM node:alpine

ENV LANG C.UTF-8

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

ADD package.json /

# Copy data for add-on
COPY app.ts /
COPY routes/index.ts /routes/
COPY API-service.ts /
COPY tsconfig.json /
COPY package.json /
COPY package-lock.json /

EXPOSE 3000

RUN npm install typescript -g
RUN npm install
RUN tsc


ENTRYPOINT ["npm", "run", "start"]