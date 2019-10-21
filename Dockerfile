
# vnc-recorder
# Image inspired by Richard North's own vnc-recorder (https://github.com/testcontainers/vnc-recorder)
#
# VERSION	1.0

FROM debian:jessie-slim
MAINTAINER Simon Urli <simon.urli@xwiki.com>

LABEL Description="This image can be used to create a sidekick container for recording videos of VNC sessions hosted in other containers"

COPY vnc2flv-sources /root/vnc2flv
RUN apt-get update && apt-get install -y \
  python-dev gcc \
  && rm -rf /var/lib/apt/lists/*
RUN cd /root/vnc2flv && python setup.py install

ENTRYPOINT ["flvrec.py"]
CMD ["--help"]