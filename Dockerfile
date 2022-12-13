FROM golang AS builder

WORKDIR /usr/src/app
COPY . .

RUN go build hello.go

FROM scratch
COPY --from=builder /usr/src/app/hello /
CMD [ "/hello" ]