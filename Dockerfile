FROM lachlanevenson/k8s-kubectl:v1.14.5 AS k8scli

FROM grumblex/rancher-cli

COPY --from=k8scli /usr/local/bin/kubectl /usr/local/bin

ENTRYPOINT []