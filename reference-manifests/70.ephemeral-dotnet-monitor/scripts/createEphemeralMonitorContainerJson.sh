#!/bin/bash
NAMESPACE=wrd2026-diagnostics

POD=$(
  kubectl -n ${NAMESPACE} get pods \
    -l app=demo-memory-leak \
    --field-selector=status.phase=Running \
    --sort-by=.metadata.creationTimestamp \
    -o jsonpath='{.items[-1].metadata.name}'
)

NAME=ephemeral-dotnet-monitor

cat <<EOF
{
  "apiVersion": "v1",
  "kind": "Pod",
  "metadata": {
    "name": "${POD}",
    "namespace": "${NAMESPACE}"
  },
  "spec": {
    "ephemeralContainers": [
      {
        "name": "${NAME}",
        "image": "mcr.microsoft.com/dotnet/monitor:10",
        "targetContainerName": "demo-memory-leak",
        "stdin": true,
        "tty": true,
        "command": [
          "dotnet-monitor",
          "collect",
          "--no-auth"
        ],
        "securityContext": {
          "seccompProfile": {
            "type": "RuntimeDefault"
          },
          "allowPrivilegeEscalation": false
        },
        "env": [
          {
            "name": "DOTNETMONITOR_DiagnosticPort__ConnectionMode",
            "value": "Listen"
          },
          {
            "name": "DOTNETMONITOR_DiagnosticPort__EndpointName",
            "value": "/diagnosticArtifacts/dotnet-diag.sock"
          },
          {
            "name": "DOTNETMONITOR_URLS",
            "value": "http://0.0.0.0:52323"
          }
        ],
        "volumeMounts": [
          {
            "name": "artifacts-volume",
            "mountPath": "/diagnosticArtifacts"
          }
        ],
        "resources": {},
        "terminationMessagePath": "/dev/termination-log",
        "terminationMessagePolicy": "File",
        "imagePullPolicy": "IfNotPresent"
      }
    ]
  }
}
EOF
