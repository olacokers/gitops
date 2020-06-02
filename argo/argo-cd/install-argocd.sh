#!/bin/bash

# https://argoproj.github.io/argo-cd/

# 1. kubenetes cluster context set and have access to the cluster
# 2. gitops operator namespace already created and exist
# 3. apply gitops operator manifest 
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# -------
# app.yaml
# defines how we want our app to be deployed
# git repo url [or maybe a container registry url]
# repo path, recursively and apply all the yaml
# Ability to deploy to multiple clusters and namespaces
# in this case default cluster where argo is deployed
# Sync policy
# ------
# Steps
# kubectl create namespace argocd
# kubectl apply -n argocd -f /mnt/c/Users/olsowemi/github/SandBox/GitOps/argo/argo-cd/install.yaml
# kubectl port-forward svc/argocd-server -n argocd 8080:443
# kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

# developers...
# kubectl apply -n argocd -f /mnt/c/Users/olsowemi/github/SandBox/GitOps/argo/argo-cd/app.yaml

# CLI create app but needs argocd cli installed
# ---------------
# argocd app create --name test \
# --repo https://github.com/marcel-dempers/docker-development-youtube-series \
# --dest-server https://kubernetes.default.svc \
# --dest-namespace marcel --path kubernetes

# output helm-chart release into helm-release.
# helm get manifest demo --namespace [ns] > manifest/demo.yaml

kubectl create namespace argocd

