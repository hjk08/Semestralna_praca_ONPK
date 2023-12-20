
### Konfigurácia Frontendu ###

frontend.replicaCount: Počet replík frontendovej služby. default 1.

frontend.image:
repository: Repozitár Docker obrazu pre frontend. default docker.io/hjk08/frontend.
tag: Tag Docker image. default latest
pullPolicy: Politika sťahovania image. default IfNotPresent.

frontend.service:
name: Názov Kubernetes služby pre frontend, default  frontend-service.
type: Typ služby. default NodePort.
port: Port na ktorom služba počúva. default 80.
targetPort: Cieľový port kontajneru. default 8080.
nodePort: Externý port pre NodePort službu. default 30080.


### Environmentálne Premenné ###

EnvVariables.REACT_APP_APIHOSTPORT: Nastavenie hostiteľa a portu API pre frontend aplikáciu, default "10.96.1.2:80"
