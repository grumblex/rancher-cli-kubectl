FROM lachlanevenson/k8s-kubectl AS k8scli

#FROM grumblex/rancher-cli
FROM alpine:3.11
RUN apk add --no-cache ca-certificates openssh-client wget curl
RUN wget https://github.com/rancher/cli/releases/download/v2.4.9/rancher-linux-amd64-v2.4.9.tar.gz \
  && tar -xzf rancher-linux-amd64-v2.4.9.tar.gz 
COPY rancher /usr/bin/
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
  && chmod +x kubectl
COPY kubectl /usr/bin/
WORKDIR /mnt
ENTRYPOINT ["rancher"]
CMD  ["--help"]

COPY --from=k8scli /usr/local/bin/kubectl /usr/local/bin

ENTRYPOINT []
