FROM alpine as builder

WORKDIR /root

ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /root/ngrok-stable-linux-amd64.zip 

RUN unzip /root/ngrok-stable-linux-amd64.zip 

FROM scratch

COPY --from=builder /root/ngrok /

ENV HOME=/root

WORKDIR /root

ENTRYPOINT ["/ngrok"]
