Tento Helm chart inštaluje a konfiguruje backend aplikáciu spolu s MongoDB databázou.

## Konfigurácia Backendu ##
replicaCount: Počet replík pre backend aplikáciu. default 1.

image:
repository: Docker repozitár pre backend image. default docker.io/hjk08/backend.
tag: Tag Docker image. default latest.
pullPolicy: Politika sťahovania image. default IfNotPresent.

## NodePort Služba ##

serviceNodePort:
name: Názov NodePort služby. default backend-service-nodeport.
type: Typ služby. default NodePort.
port: Port na ktorom služba počúva. default 80.
targetPort: Cieľový port kontajneru. default 9080.
nodePort: Externý port. default 30090.

## ClusterIP Služba ##

serviceClusterIP:
name: Názov ClusterIP služby. default backend-service-clusterip.
type: Typ služby. default ClusterIP.
port: Port na ktorom služba počúva. default 80.
targetPort: Cieľový port kontajneru. default 9080.
clusterIP: Špecifikovaná ClusterIP. default 10.96.1.2.

## Konfigurácia MongoDB ##

mongodb:
enabled: Aktivácia MongoDB. default true.
auth.enabled: Aktivácia autentifikácie pre MongoDB. default false.
service.clusterIP: ClusterIP pre MongoDB službu. default 10.96.1.1.
image.tag: Tag Docker image pre MongoDB. default 4.4.15-debian-10-r8.
persistence.enabled: Zapnutie perzistencie dát. default false.
initdbScripts: Skripty pre inicializáciu databázy, vrátane vytvorenia používateľa, kolekcie a vloženia počiatočných dát.

## Environmentálne Premenné ##

EnvVariables:
MONGO_CONN_STR: Pripojovací reťazec pre MongoDB. default "mongodb://10.96.1.1:27017/platformsdb".
MONGO_USERNAME: Používateľské meno pre MongoDB. default admin.
MONGO_PASSWORD: Heslo pre MongoDB. default password
