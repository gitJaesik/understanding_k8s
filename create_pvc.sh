#!/bin/bash

cat <<EOT >> pvc-name-branch.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: name-pvc
  namespace: namespace
spec:
  accessModes:
   - ReadWriteMany
  volumeMode: Filesystem
  volumeName: namespace-volumename
  resources:
    requests:
      storage: 30Gi
EOT

kubectl apply -f pvc-name-branch.yaml
rm pvc-name-branch.yaml
