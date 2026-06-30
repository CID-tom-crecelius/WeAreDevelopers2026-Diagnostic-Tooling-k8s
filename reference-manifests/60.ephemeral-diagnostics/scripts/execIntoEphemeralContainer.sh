#!/usr/bin/env bash
NAMESPACE=wrd2026-diagnostics

POD=$(
  kubectl -n ${NAMESPACE} get pods \
    -l app=demo-memory-leak \
    --field-selector=status.phase=Running \
    --sort-by=.metadata.creationTimestamp \
    -o jsonpath='{.items[-1].metadata.name}'
)

CONTAINERNAME=diag-debug-live
COMMAND=bash

if [[ $# -ge 1 && -n "${1:-}" ]]; then
  CONTAINERNAME="$1"
  COMMAND=sh
fi

kubectl exec -n ${NAMESPACE} -it "${POD}" \
  -c ${CONTAINERNAME} \
  -- ${COMMAND}

