#!/usr/bin/env bash
NAMESPACE=wad2026-diagnostics

POD=$(
  kubectl -n ${NAMESPACE} get pods \
    -l app=demo-memory-leak \
    --field-selector=status.phase=Running \
    --sort-by=.metadata.creationTimestamp \
    -o jsonpath='{.items[-1].metadata.name}'
)

NAME=diag-debug-live

cat <<EOF
{
  "kind": "Pod",
  "apiVersion": "v1",
  "metadata": {
    "name": "${POD}",
    "namespace": "${NAMESPACE}"
  },
  "spec": {
    "ephemeralContainers": [
      {
        "name": "${NAME}",
        "image": "<your-registry>/demo-diagnostic-tooling:0.1.0",
        "command": [
          "sh",
          "-c",
          "sleep 365d"
        ],
        "securityContext": {
          "seccompProfile": {
            "type": "RuntimeDefault"
          }
        },
        "stdin": true,
        "tty": true,
        "resources": {},
        "terminationMessagePath": "/dev/termination-log",
        "terminationMessagePolicy": "File",
        "imagePullPolicy": "IfNotPresent",
        "targetContainerName": "demo-memory-leak",
        "volumeMounts": [
          {
            "name": "tmp-volume",
            "mountPath": "/tmp"
          },
          {
            "name": "artifacts-volume",
            "mountPath": "/diagnosticArtifacts"
          }
        ]
      }
    ]
  }
}
EOF
