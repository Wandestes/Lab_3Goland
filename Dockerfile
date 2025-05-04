FROM golang:1.22.0-alpine AS container1
WORKDIR /proj
COPY . .
RUN go build -o /proj/build/fizzbuzz

FROM scratch
WORKDIR /proj
COPY --from=container1 /proj/build/fizzbuzz ./
COPY --from=container1 /proj/templates ./templates/
CMD ["./fizzbuzz", "serve"]