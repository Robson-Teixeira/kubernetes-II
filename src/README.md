## Conceitos e resumos
- ReplicaSet pode encapsular/gerenciar (recriando POD's que pararam de funcionar, por exemplo) 1 ou mais POD's
- Deployment encapsula o ReplicaSet e permite o versionamento de imagens e POD's. Por meio de comandos extras é possível validar/verificar fluxo
- Volume possui ciclo de vida independente dos containers, mas é dependente do POD

## Comandos
- `kubectl get replicaset` ou `kubectl get rs` lista ReplicaSets
- `kubectl get deployments` lista Deployments
- `kubectl rollout history deployment <nome-deployment>` lista histórico de alterações
- `kubectl apply -f <nome-arquivo>.yaml/.json --record` aplica arquivo para criar POD de maneira declarativa, armazenando comando no histórico de alterações do Deployment
- `kubectl annotate deployment <nome-deployment> kubernetes.io/change-cause="<mensagem>"` anota alterações no histórico
- `kubectl rollout undo deployment <nome-deployment> --to-revison=<sequencial-revisão>` altera Deployment para versão especificada sem necessidade de alterar arquivo .yaml/.json
- `kubectl delete deployment <nome-deployment>` deleta Deployment especificado
- `kubectl exec -it <nome-pod> --container <nome-container> -- bash` executa bash no container especificado dentro de um POD especificado