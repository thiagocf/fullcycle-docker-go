FROM golang AS builder

WORKDIR /go/src/app

COPY . .

RUN go build hello.go


FROM scratch

WORKDIR /app

COPY --from=builder /go/src/app .

ENTRYPOINT ["./hello"]
