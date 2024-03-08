## Conceitos e resumos
- ReplicaSet pode encapsular/gerenciar (recriando POD's que pararam de funcionar, por exemplo) 1 ou mais POD's
- Deployment encapsula o ReplicaSet e permite o versionamento de imagens e POD's. Por meio de comandos extras é possível validar/verificar fluxo
- Volume possui ciclo de vida independente dos containers, mas é dependente do POD
    >No Windows, desativar `Use the WSL 2 based engine` e adicionar diretório do host em `Resources > File sharing`
    No Linux, acessar Minikube usando `minikube ssh` e criar estrutura de diretório (se necessário, usar o `sudo`)
    No Google Cloud, criar um disco para futuros apontamentos
- PersistentVolumes possuem ciclo de vida independente dos containers e POD's
- PersistentVolumeClaim é necessário para acessar um PersistentVolume e/ou StorageClass
- StorageClass gerencia discos e Volumes, possibilitando a criação de PersistentVolumes e discos de maneira dinâmica (conforme necessidade do cluster) assim que um PersistentVolumeClaim é vinculado em um StorageClass
    >Por padrão existe localmente o hostpath que já criará um PersistentVolume de maneira automática caso seja criado um PersistentVolumeClaim.
- StatefulSet gerencia POD's mantendo uma identificação única para cada um e em caso de falha, o novo POD recebe a mesma identificação do anterior. Usam PersistentVolumes e PersistentVolumeClaims para persistência de dados
- Probes são verificações de integridade (bem-estar) das aplicações e dos POD's que às hospedam
    - Liveness (prova de vida) para validar se a aplicação dentro do POD está de pé e saber quando reiniciar o container. Status >= 200 e < 400 indicam sucesso.
    - Readiness para validar se a aplicação e POD estão prontos para receber requisições
    - Startup é utilizado principalmente em aplicações legadas que levam mais tempo para inicializar de modo que Liveness ou Readiness não conseguem resolver
- HorizontalPodAutescaler escala automaticamente o número de POD's baseado no uso de CPU
    >Para a correta utilização é necessário ativar o servidor de métricas.
    No Windows, adicionar via .yaml
    No Linux, acessar extensões usando `minikube addons list` e ativar com `minikube addons enable metrics-server`

## Comandos
- `kubectl get replicaset` ou `kubectl get rs` lista ReplicaSets
- `kubectl get deployments` lista Deployments
- `kubectl get pv` lista PersistentVolumes
- `kubectl get pvc` lista PersistentVolumeClaims
- `kubectl get sc` lista Storage Classes
- `kubectl get statefulset` lista StatefulSets
- `kubectl get horizontalpodautoscaler` ou `kubectl get hpa` lista HorizontalPodAutoscalers
- `kubectl describe horizontalpodautoscaler <nome-hpa>` ou `kubectl describe hpa <nome-hpa>` detalhes do HorizontalPodAutoscaler
- `kubectl rollout history deployment <nome-deployment>` lista histórico de alterações
- `kubectl apply -f <nome-arquivo>.yaml/.json --record` aplica arquivo para criar POD de maneira declarativa, armazenando comando no histórico de alterações do Deployment
- `kubectl annotate deployment <nome-deployment> kubernetes.io/change-cause="<mensagem>"` anota alterações no histórico
- `kubectl rollout undo deployment <nome-deployment> --to-revison=<sequencial-revisão>` altera Deployment para versão especificada sem necessidade de alterar arquivo .yaml/.json
- `kubectl delete deployment <nome-deployment>` deleta Deployment especificado
- `kubectl exec -it <nome-pod> --container <nome-container> -- bash` executa bash no container especificado dentro de um POD especificado