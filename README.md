# echo を試しに触る

## 環境構築メモ

docker で go の開発環境作った時の作業を忘れないようにメモ

### 1. Dockerfile を作る

go.mod 用意

```
$ docker run -v `pwd`:/go/app -w /go/app golang:1.15-rc-alpine go mod init app
```

まずはイメージを作る

```
$ docker build -t my-echo .
$ docker image ls # my-echo イメージが作られたことを確認
```

そしたらコンテナを作る。
main.go ではポートを 1323 に指定してるので、それに合わせる。

```
$ docker run -p 1323:1323 -d --name my-echo my-echo
$ docker ps # 起動しているコンテナを確認
```

疎通確認

```
$ curl localhost:1323
Hey, Guys!
```

### 2. DockerCompose
docker-compose で起動する
```
$ docker-compose up -d
```

### 3. hot reload を試す


## 備考

### Docker でよく使うコマンドメモ

コンテナ操作

```
$ docker ps # 起動中コンテナ確認
$ docker start <ContainerID> # コンテナ起動
$ docker stop <ContainerID> # コンテナ停止
$ docker rm <ContainerID> # コンテナ削除
```

イメージ操作

```
$ docker image ls # docker image 確認
$ docker rmi <ImageId> # docker image のs買うじょ
$ docker image prune # 使ってない docker image の削除
```

## 参考リンク

- https://echo.labstack.com/guide
- https://hub.docker.com/_/golang
