# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.209.6/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use hirsuite or bionic on local arm64/Apple Silicon): hirsute, focal, bionic
ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends wget unzip curl apt-transport-https ca-certificates gnupg jq openssh-client software-properties-common -y \
    && wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip \
    && unzip terraform_0.14.7_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && terraform -v \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main"  | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg  | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && apt-get update -y \
    && apt-get install google-cloud-cli -y \