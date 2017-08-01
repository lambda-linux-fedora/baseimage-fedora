FROM fedora:25

CMD ["/sbin/my_init"]

COPY [ \
  "./runit-*.x86_64.rpm", \
  "./baseimage-fedora.tar", \
  "./run", \
  "/tmp/docker-build/" \
]

RUN \
  pushd /tmp/docker-build && \
    tar xvf baseimage-fedora.tar && \
  popd && \
  /tmp/docker-build/run && \
  \
  # cleanup
  rm -rf /tmp/docker-build && \
  dnf clean all && \
  rm -rf /var/cache/dnf/* && \
  rm -rf /tmp/* && \
  rm -rf /var/tmp/*
