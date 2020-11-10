# Kubernates


## CoreDNS

DNS 서비스를 이용한 서비스 검색

- 서비스를 생성하면, 대응되는 DNS 엔트리가 생성됩니다.
  - <Service-Name>.<Namespace-Name>.svc.cluster.local
in pods
- curl svc.default.svc.cluster.local

### CoreDNS란

- 내부에서 DNS 서버 역할을 하는 POD으로 존재함
- 각 미들웨어를 통해 아래 기능 동작
  - logging, caching, k8s querying, data write using by etcd (through api server) and so on.
- Configmap 저장소를 사용해 dns 설정파일 저장
- POD에서도 Subdomain을 사용하면 DNS서비스를 사용가능하다.

## Storage

### 볼륨(Volume)

- 볼륨의 종류
  - 임시 볼륨
    - emptyDir
      - 컨테이너끼리 공유를 위해
  - 로컬 볼륨 (노드로 보면 되며, 노드가 변경되면 다시 봐야함)
    - hostpat됨
    - local
  - 네트워크 볼륨
    - iSCSI
    - NFS
    - cephFS
    - glusterFS
    - ...
  - 네트워크 볼륨 (클라우드 종속적)
    - gcePersistentDisk
    - awsEBS
    - azureFile
    - ...
- 주로 사용 가능한 볼륨의 유형
  - emptyDir: 일시적인 데이터 저장, 비어있는 디렉터리
  - hostPath: 포드에 호스트 노드의 파일 시스템에서 파일이나 디렉토리를 마운트
  - nfs: 기존 NFS(네트워크 파일 시스템) 공유가 포드에 장착
  - gcePersistentDisk: 구글ㅍ컴퓨트 엔진 영구디스크 마운트
  - persistentVolumeClain: 사용자가 특정 클라우드 환경의 세부사항을 모른채 GCE PersistentDisk 또는 iSCSI 볼륨과 같은 내구성 스토리지를 요구(Claim) 할 수 있는 방법
  - configMap, Secret, downwardAPI : 특수한 유형의 볼륨

## 쿠버네티스 모니터링 시스템과 아키텍처

- 모니터링 서비스 플랫폼
  - 쿠버네티스를 지원하는 다양한 모니터링 플랫폼
  - Heapster (deprecated)
  - Metrics Service
  - cAdvisor (kubelet)
  - Promethus
  - ELK
​
- 쿠버네티스의 메트릭 수집 모니터링 아키텍처에서 코어메트릭 파이프라인 경량화
- 힙스터를 deprecated하고 모니터링 표준으로 메트릭서버(metrics-server) 도입
​
```bash
$ kubectl top node
$ kubectl top pod
```

- 리소스 모니터링 도구
  - 리소스 메트릭 파이프라인
  - 완전한 메트릭 파이프라인
​
## 애플리케이션 로그 관리

- Kubernetes 애플리케이션 로그 확인
  - 로그는 컨테이너 단위로 로그 확인 가능
  - 싱글 컨테이너 포드의 경우 포드까지만 지정하여 로그 확인
​
- journalctl -u kubelet -f
- pstree (process tree)
- 로그 위치: cd /var/log/containers
  - weave-net-7c9fc_kube-system_weave_npc-......log
​
​
​
​
​
​
​
​​
​
​


## ref
www.boanproject.com