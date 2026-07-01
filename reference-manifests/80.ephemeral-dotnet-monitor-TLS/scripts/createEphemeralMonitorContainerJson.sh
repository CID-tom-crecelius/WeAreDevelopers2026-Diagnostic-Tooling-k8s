#!/bin/bash
NAMESPACE=wad2026-diagnostics

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
        "image": "mcr.microsoft.com/dotnet/monitor:10",
        "targetContainerName": "demo-memory-leak",
        "stdin": true,
        "tty": true,
        "command": [
          "dotnet-monitor",
          "collect",
          "--no-http-egress"
        ],
        "securityContext": {
          "seccompProfile": {
            "type": "RuntimeDefault"
          },
          "allowPrivilegeEscalation": false
        },
        "env": [
          {
            "name": "DOTNETMONITOR_Storage__DefaultSharedPath",
            "value": "/diagnosticArtifacts"
          },
          {
            "name": "DOTNETMONITOR_DiagnosticPort__ConnectionMode",
            "value": "Listen"
          },
          {
            "name": "DOTNETMONITOR_DiagnosticPort__EndpointName",
            "value": "/diagnosticArtifacts/dotnet-mymonitor.sock"
          }
        ],
        "volumeMounts": [
          {
            "name": "artifacts-volume",
            "mountPath": "/diagnosticArtifacts"
          },
          {
            "name": "dotnet-monitor-volume",
            "mountPath": "/etc/dotnet-monitor"
          },
          {
            "name": "dotnet-monitor-certificate-volume",
            "mountPath": "/etc/ssl/certs/dotnet-monitor-tls"
          },
          {
            "name": "egress-volume",
            "mountPath": "/diagnosticsEgressArtifacts"
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
