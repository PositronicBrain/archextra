FROM pritunl/archlinux:2015-11-07

MAINTAINER Federico Squartini "federico.squartini@gmail.com"

COPY pacman.conf /etc/pacman.conf

RUN mkdir /root/.gnupg \
 &&  touch /root/.gnupg/drmngr_ldapservers.conf \
 && pacman-key -r 4209170B \
 && pacman-key --lsign-key 4209170B \
 && pacman-key -r B0544167 \
 && pacman-key --lsign-key B0544167 \
 && pacman -Suy --noconfirm \
 && pacman -S --noconfirm yaourt

