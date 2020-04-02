
FROM ubuntu:18.04

MAINTAINER Johani Vajakas

# build intial apk binary cache and install iperf
RUN apt-get update && apt-get install -y iperf && apt-get clean \
    && adduser -S iperf

USER iperf

# Expose the default iperf server port
EXPOSE 5001/tcp 5001/udp

# entrypoint allows you to pass your arguments to the container at runtime
# very similar to a binary you would run. For example, in the following
# docker run -it <IMAGE> --help' is like running 'iperf --help'
ENTRYPOINT ["iperf"]

# iperf -s = run in Server mode
# CMD ["-s"]
