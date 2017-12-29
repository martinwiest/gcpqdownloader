FROM ubuntu:16.04
Maintainer schr0ttie

ENV USERNAME="youruser" USERPASS="yoursecretpassword" pqdown=/usr/bin/pqdown.sh pqmerge=/usr/bin/pqdownmerge.sh

RUN export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install curl \
    libimage-exiftool-perl \
    build-essential gawk ghostscript groff unzip \
    gpsbabel dos2unix dc units sharutils && \
    rm -rf /var/lib/apt/lists/*
# that stuff for geotool 
ADD source/geo-*.tar.gz /mnt/
ADD source/scripts/ /usr/bin/
RUN ls /usr/bin
RUN ln -s /usr/bin/pqdown.sh /usr/bin/pqdown && ln -s /usr/bin/pqdownmerge.sh /usr/bin/pqdownmerge
RUN cd /mnt/geo && make && \
PREFIX=/usr make install && PREFIX=/usr make install man && \
rm -r /mnt/geo && chmod +x /usr/bin/pqdown*.sh && apt-get -y remove build-essential 
VOLUME /mnt/output
