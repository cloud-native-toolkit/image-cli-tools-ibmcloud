ARG TERRAFORM_VERSION=v1.2
ARG BASE_OS=alpine
FROM quay.io/cloudnativetoolkit/cli-tools-core:${TERRAFORM_VERSION}-v2.0.1-${BASE_OS}

ARG TARGETPLATFORM

# Install the ibmcloud cli
RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh && \
    ibmcloud plugin install container-service -f && \
    ibmcloud plugin install container-registry -f && \
    ibmcloud plugin install observe-service -f && \
    if [[ "$TARGETPLATFORM" != "linux/arm64" ]]; then ibmcloud plugin install vpc-infrastructure -f; fi && \
    ibmcloud config --check-version=false && \
    chmod -R g=u ${HOME}
