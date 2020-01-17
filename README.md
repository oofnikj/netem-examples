# Demonstration of `netem` with Docker Compose and `iperf3`

Short demonstration of `netem` using Docker Compose, `ping` and `iperf3`.

To use, set the arguments you would use for `netem` as environment variable `NETEM` and run `docker-compose up`:
```
$ export NETEM="rate 5mbit delay 100ms 10ms"
$ docker-compose up