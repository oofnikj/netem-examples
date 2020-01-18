FROM alpine
RUN apk update && apk add iproute2 iperf3 tcpdump
