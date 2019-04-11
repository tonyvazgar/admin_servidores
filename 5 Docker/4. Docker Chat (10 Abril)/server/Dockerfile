FROM golang:1.12.1

# RUN adduser --disabled-password --gecos '' api
# USER api

WORKDIR /go/src/app
COPY . .

RUN go get -u github.com/chzyer/readline
RUN go build -o main
# RUN ./main

# CMD [ "conn localhost:80" ]
CMD ["./main"]
