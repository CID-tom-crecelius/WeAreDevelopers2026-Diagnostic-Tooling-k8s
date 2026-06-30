#!/bin/bash
NAMESPACE=wrd2026-diagnostics

POD=$(
  kubectl -n ${NAMESPACE} get pods \
    -l app=demo-memory-leak \
    --field-selector=status.phase=Running \
    --sort-by=.metadata.creationTimestamp \
    -o jsonpath='{.items[-1].metadata.name}'
)

CONTAINER=ephemeral-busybox

echo "injecting Container ${CONTAINER} into POD ${POD}"

kubectl debug -n ${NAMESPACE} "${POD}" \
  --image=hub.docker.com/library/busybox:1.38 \
  --target=demo-memory-leak \
  --container=${CONTAINER} \
  -- sh -c 'sleep 365d' # --> keeps the ephemeral container alive for 365 even after exiting the shell



