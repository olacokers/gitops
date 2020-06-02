#!/bin/bash
kubectl create ns fluxcd
helm upgrade --namespace fluxcd --install --wait \
--set git.url=git@github.com:${GHUSER}/${GHREPO}  \
--set git.pollInterval=1m --set git.path=           \
flux fluxcd/flux