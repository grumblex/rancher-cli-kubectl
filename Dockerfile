FROM lachlanevenson/k8s-kubectl AS k8scli

FROM grumblex/rancher-cli

COPY --from=k8scli /usr/local/bin/kubectl /usr/local/bin

ENTRYPOINT []