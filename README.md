# Demonstration of `netem` with Docker Compose and `iperf3`

Short demonstration of `netem` using Docker Compose, `ping` and `iperf3`.

The server container also creates a packet capture at `./server.pcap` which can be analyzed after the test.
NOTE: this file must be created and owned by root beforehand.

To use, set the arguments you would use for `netem` as environment variable `NETEM` and run `docker-compose up`:
```
$ sudo touch server.pcap
$ export NETEM="rate 5mbit delay 100ms 10ms"
$ docker-compose up
```

[![asciicast](https://asciinema.org/a/x2cpIRXYK4exdBc1e8l254eGV.svg)](https://asciinema.org/a/x2cpIRXYK4exdBc1e8l254eGV)


### Netfilter logging
For the packet capture to be meaningful, we must capture from the netfilter log rather than from the interface directly. This is because `libpcap` captures _after_ the queuing discipline stage (i.e., after `netem`), but we want to capture _before_ to observe the effects of the queueing discipline as if they were caused by actual wire congestion.

Reference: https://unix.stackexchange.com/a/527428