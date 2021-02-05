FROM node:alpine

ENV LANG C.UTF-8

SHELL ["/bin/sh", "-o", "pipefail", "-c"]

ADD package.json /

# Install requirements for add-on
RUN apk add --no-cache python3

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

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

RUN nohup python3.7 main.py &

CMD ["npm", "run", "start"]