#!/bin/bash

#install HelmRelease CRD
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/helm-v3-dev/deploy/flux-helm-release-crd.yaml

#install Helm Operator
helmv3 upgrade -i helm-operator fluxcd/helm-operator --wait \
--namespace fluxcd \
# --set git.ssh.secretName=flux-git-deploy \
--set git.pollInterval=1m   \
--set chartsSyncInterval=1m \
--set configureRepositories.enable=true \
--set configureRepositories.repositories[0].name=stable \
--set configureRepositories.repositories[0].url=https://kubernetes-charts.storage.googleapis.com \
--set extraEnvs[0].name=HELM_VERSION \
--set extraEnvs[0].value=v3 \
--set image.repository=docker.io/fluxcd/helm-operator-prerelease \
--set image.tag=helm-v3-dev-0b11d9d0

# fluxctl identity --k8s-fwd-ns fluxcd