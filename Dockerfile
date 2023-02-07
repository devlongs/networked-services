FROM golang:1.19-alpine

COPY . /go/src/go-docker

WORKDIR /go/src/go-docker

COPY go.mod ./

# COPY go.sum ./

RUN go mod download

COPY . .

RUN ["go", "get", "github.com/githubnemo/CompileDaemon"]
RUN ["go", "install", "github.com/githubnemo/CompileDaemon"]

ENTRYPOINT CompileDaemon -polling -log-prefix=false -build="go build ." -command="./go-docker" -directory="./"