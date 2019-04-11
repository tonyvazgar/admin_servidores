FROM golang:1.12.1

# RUN adduser --disabled-password --gecos '' api
# USER api

WORKDIR /go/src/app
COPY . .

CMD [ "go get -u github.com/chzyer/readline" ]
CMD [ "go build -o main" ]
# CMD [ "./main" ]
# CMD [ "conn 0.0.0.0:4000" ]
ENTRYPOINT [ "/go/src/app/main", "conn 0.0.0.0:80"]
CMD [ "hola desde cliente 1" ]

# Para ver los logs del docker en especifico
# docker container ps
# docker logs -f 4dockerchat10abril_server_1