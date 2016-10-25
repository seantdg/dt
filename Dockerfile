#
# Ubuntu Desktop (LXDE) Dockerfile
#
# https://github.com/dockerfile/ubuntu-desktop
#

# Pull base image.
FROM ubuntu

# Install LXDE and VNC server.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver firefox && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

RUN echo 'bash -c "vncserver :1 -geometry 1280x800 -depth     24 && tail -F /root/.vnc/*.log"' > /var/tmp/startup.sh
RUN chmod 755 /var/tmp/startup.sh

# Define default command.
CMD ["bash", "/var/tmp/startup.sh"]

# Expose ports.
EXPOSE 5901
