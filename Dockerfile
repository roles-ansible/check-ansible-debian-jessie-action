FROM debian:jessie

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-debian-jessie-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-debian-jessie-action"

LABEL "com.github.actions.name"="check-ansible-debian-jessie"
LABEL "com.github.actions.description"="Check ansible role or playbook with Debian jessie"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN apt-get update -y && apt-get install -y \
    software-properties-common \
    build-essential \
    libffi-dev \
    libssl-dev \
    python-dev \
    python-pip \
    git \
    apt-utils \
    systemd

RUN pip2 install ansible

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
