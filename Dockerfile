FROM centos:8

# Terraform 0.11.14
# Terraform 0.12.20

ARG TERRAFORM_VERSION="0.11.14"
ARG ANSIBLE_VERSION="2.9.4"

LABEL maintainer="Roy Bales <rbales79@gmail.com>"
LABEL terraform_version=${TERRAFORM_VERSION}
LABEL ansible_version=${ANSIBLE_VERSION}

RUN dnf install -y unzip openssh-clients jq python3 python3-pip git sshpass \
    && pip3 install ansible==${ANSIBLE_VERSION} awscli \
    && curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform*.zip \
    && mv terraform /usr/local/bin

ENV ANSIBLE_HOST_KEY_CHECKING="False"
