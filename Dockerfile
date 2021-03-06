# go1.15 をイメージ指定
FROM golang:1.15-rc-alpine

# 作業ディレクトリを指定
WORKDIR /go/src/app

COPY . .

# app をビルド
RUN apk add --no-cache \
  alpine-sdk \
  git \
  && go get github.com/labstack/echo \
  && go build -o app

CMD ["./app"]
