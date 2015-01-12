FROM c12e/debian
MAINTAINER CognitiveScale

RUN apt-get update && \
    apt-get install -y --force-yes \
        curl \
        git \
        iceweasel \
        xvfb 

# Setup NodeSource Official PPA
RUN curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get update && \
    apt-get install nodejs -y --force-yes

RUN apt-get clean  autoclean && \
    apt-get -y autoremove && \
    mkdir -p /logs /data && \
    rm -rf /var/cache/apt/* /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

ENV DISPLAY=":0" \
    LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/"

CMD ["/bin/bash"]
