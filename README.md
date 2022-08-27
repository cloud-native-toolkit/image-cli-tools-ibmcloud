# image-cli-tools-ibmcloud

Container image with tools for interacting with IBM Cloud.

This image is built upon [quay.io/cloudnativetoolkit/cli-tools-core](https://quay.io/cloudnativetoolkit/cli-tools-core) which has common tools for interacting with cloud environments, including **terraform**, **terragrunt**, **kubectl** and **oc** clis.

## Contents

This image adds the following:

- ibmcloud cli
- ibmcloud container-service plugin
- ibmcloud container-registry plugin
- ibmcloud observe-service plugin
- ibmcloud vpc-infrastructure plugin

## Container registry

The build automation pushes the built container image to [quay.io/cloudnativetoolkit/cli-tools-ibmcloud](https://quay.io/cloudnativetoolkit/cli-tools-ibmcloud)

### Floating tags

The floating image tags use the following convention:

- `latest` - the latest **alpine** version of the image (currently terraform v1.2)
- `alpine` - the latest **alpine** version of the image (currently terraform v1.2)
- `fedora` - the latest **fedora** version of the image (currently terraform v1.2)
- `v1.2` - the latest **alpine** version of the image using terraform v1.2
- `v1.1` - the latest **alpine** version of the image using terraform v1.1
- `v1.0` - the latest **alpine** version of the image using terraform v1.0
- `v1.2-alpine` - the latest **alpine** version of the image using terraform v1.2
- `v1.1-alpine` - the latest **alpine** version of the image using terraform v1.1
- `v1.0-alpine` - the latest **alpine** version of the image using terraform v1.0
- `v1.2-fedora` - the latest **fedora** version of the image using terraform v1.2
- `v1.1-fedora` - the latest **fedora** version of the image using terraform v1.1
- `v1.0-fedora` - the latest **fedora** version of the image using terraform v1.0

### Pinned tags

Each release within the repository corresponds to a pinned image tag that will never be moved to another image. The pinned tags use the following naming convention:

```text
{terraform version}-{release tag}-{base OS image}
```

where:

- `{terraform version}` - is the major and minor version of the terraform cli (e.g. v1.1)
- `{release tag}` - is the release tag for this repository (e.g. v1.0.0)
- `{base OS image}` - is the base OS image (`alpine` or `fedora`) 

For example:

```text
v1.1-v1.0.0-alpine
```

## Usage

The image can be used by referring to the image url. The following can be used to run the container image interactively:

```shell
docker run -it quay.io/cloudnativetoolkit/cli-tools-ibmcloud
```

## Development

To build the default image using the latest version of terraform on alpine, run the following:

```shell
docker build -t cli-tools-ibmcloud .
```

### Changing terraform versions

The terraform version can be changed by passing the `TERRAFORM_VERSION` as a build arg. For example:

```shell
docker build --build-arg TERRAFORM_VERSION=v1.1 -t cli-tools-ibmcloud:v1.1 .
```

### Changing base OS versions

The base OS can be changed by passing the `BASE_OS` as a build arg. Only `alpine` and `fedora` are currently supported for this value. For example:

```shell
docker build --build-arg BASE_OS=fedora -t cli-tools-ibmcloud:fedora .
```
