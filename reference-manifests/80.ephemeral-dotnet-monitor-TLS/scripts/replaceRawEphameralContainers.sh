#!/bin/bash

NAMESPACE=wad2026-diagnostics

POD=$(
  kubectl -n ${NAMESPACE} get pods \
    -l app=demo-memory-leak \
    --field-selector=status.phase=Running \
    --sort-by=.metadata.creationTimestamp \
    -o jsonpath='{.items[-1].metadata.name}'
)

FILE=$1

kubectl replace --raw \
  /api/v1/namespaces/${NAMESPACE}/pods/${POD}/ephemeralcontainers \
  -f ${FILE}
