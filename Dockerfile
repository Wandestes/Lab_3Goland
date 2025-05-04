FROM golang:1.22.0-alpine
WORKDIR /proj
COPY . .
RUN go build -o build/fizzbuzz
CMD ["./build/fizzbuzz", "serve"]