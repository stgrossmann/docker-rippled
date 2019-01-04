FROM centos:7
MAINTAINER Stefan Großmann <39296252+stgrossmann@users.noreply.github.com>

RUN set -ex \
  && rpm -Uvh https://mirrors.ripple.com/ripple-repo-el7.rpm \
  && yum -y install --enablerepo=ripple-stable rippled

# peer_port 51235
# websocket_public_port 5005
# websocket_port (trusted access) 6006
EXPOSE 51235 5005 6006

# Share the ripple data directory
VOLUME /var/lib/rippled

CMD /opt/ripple/bin/rippled --fg --conf /opt/ripple/etc/rippled.cfg
