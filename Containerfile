ARG TERRAFORM_VERSION=v1.9
ARG BASE_OS=alpine
FROM quay.io/cloudnativetoolkit/cli-tools-core:${TERRAFORM_VERSION}-v2.1.0-${BASE_OS}

ARG TARGETPLATFORM

USER root

# Install ibmcloud cli
RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh && \
    ibmcloud plugin install container-service -f && \
    ibmcloud plugin install container-registry -f && \
    ibmcloud plugin install observe-service -f && \
    ibmcloud plugin install vpc-infrastructure -f && \
    ibmcloud config --check-version=false && \
    chown -R devops ${HOME}/.bluemix && \
    chmod -R g=u ${HOME}/.bluemix

USER devops
