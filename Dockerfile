FROM golang:alpine AS builder

WORKDIR /app
RUN go mod init hello-full-cycle
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello-full-cycle .

FROM scratch
COPY --from=builder /app /

CMD ["/hello-full-cycle"]
