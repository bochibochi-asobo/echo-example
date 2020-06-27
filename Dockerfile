# go1.15 をイメージ指定
FROM golang:1.15-rc-alpine as build

# 作業ディレクトリを指定
WORKDIR /go/app

# カレントディレクトリをマウント？
COPY . .

# app をビルド
RUN apk add --no-cache git \
  && go get github.com/labstack/echo \
  && go build -o app

# alpine をイメージ指定
FROM alpine

# 作業ディレクトリを指定
WORKDIR /app

# app のビルド
COPY --from=build /go/app/app .

# グループとユーザ作成、権限付与を実行
RUN addgroup go \
  && adduser -D -G go go \
  && chown -R go:go /app/app

CMD ["./app"]
