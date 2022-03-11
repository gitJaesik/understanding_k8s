#!/bin/bash

cat <<EOT > busybox-pvc-deploy-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox-pvc-deploy-pod
  labels:
    app: busybox-pvc-deploy-pod
spec:
  container:
  - name: busybox-pvc-deploy-pod
    image: busybox
    command: ['sh', '-c', 'echo Hello Kubernetes! && sleep 3600']
    resources:
      limits:
        memory: "256Mi"
        cpu: "2048m"
    volumeMounts:
      - mountPath: "/app/pvc"
        name: app-volume
  volumes:
  - name: app-volume
    persistentVolumeClaims:
      claimName: app-pvc
EOT

kubectl apply -f busybox-pvc-deploy-pod

# check pod is on
busyboxcheck="busybox-pvc-deploy-pod1/1Running"
while [ true ];
do
  sleep 1
  kgpcmd="$(kubectl get pod | tr -d ' ' | grep busy | cut -c 1-34)"
  if [ $kgpcmd = $busyboxcheck ]; then
    break
  fi
  echo "busybox is not alived yet"
done
echo "busybox is alive"

kubectl exec busybox-pvc-deploy-pod -- ls -al /app/pvc
kubectl cp content busybox-pvc-deploy-pod:/app/pvc/content
kubectl delete pod busybox-pvc-deploy-pod

rm -rf busybox-pvc-deploy-pod.yaml
