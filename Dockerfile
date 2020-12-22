FROM node:12.10.0-alpine

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.cloud.tencent.com/g" /etc/apk/repositories \
 && apk update \
 && apk add --no-cache bash tzdata vim curl\
 && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && apk add --no-cache nginx \
 && mkdir -p /run/nginx

RUN NPM_REG="http://mirrors.cloud.tencent.com/npm";NPM_REG1="http://mirrors.tencentyun.com/npm"; \
   curl ${NPM_REG1} >/dev/null 2>&1 && NPM_REG=${NPM_REG1}; echo "${NPM_REG}" | tee -a /tmp/.npm_reg
