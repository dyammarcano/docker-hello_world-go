FROM golang:1.17.0-alpine as build

WORKDIR /app

COPY ./src .

RUN go build 

FROM scratch

WORKDIR /app

COPY --from=build /app/hello /app/hello_world

CMD ["./hello_world"]
