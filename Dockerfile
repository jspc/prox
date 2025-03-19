FROM golang:1.24-alpine as build 
WORKDIR /code
ADD . .
RUN go build -o prox 


FROM alpine
COPY --from=build /code/prox /prox
EXPOSE 8080

CMD ["/prox"]