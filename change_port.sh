
## Remove all running containers
docker rm $(docker ps -a -q) -f

## Start Instana
instana start

## Remove default instance instana-ui-backend 
docker rm instana-ui-backend -f

## Run new instance of instana-ui-backend with port 9991
## template: 
## docker run --name=instana-ui-backend --user=996:0 --env=COMPONENT_ID=ui-backend --env=COMPONENT_LOGLEVEL=Info --env='HEAP_OPTS=-Xss265k -Xms2992M -Xmx2992M' --env=GC_THREADS=4 --env=IMPORT_TLS_PATH=/etc/secrets --env=JVM_OPTS=-Dcom.redhat.fips=false --volume=/root/.instana/etc/instana/ui-backend/logback.xml:/etc/instana/ui-backend/logback.xml:ro,z --volume=/var/log/instana/instana/ui-backend:/var/log/instana/ui-backend:z --volume=/root/cert/tls.key:/etc/secrets/tls.key:ro,z --volume=/root/cert/tls.crt:/etc/secrets/tls.crt:ro,z --volume=/root/.instana/etc/instana/ui-backend/config.yaml:/etc/instana/ui-backend/config.yaml:ro,z --network=instana -p 127.0.0.1:8080:8600 -p 127.0.0.1:9991:8601 -p 127.0.0.1:8602:8602 --restart=on-failure:10 --label='version=[VERSION]' --label='application=instana' --label='component=instana-ui-backend' --label='group=service' --runtime=runc --detach=true artifact-public.instana.io/backend/ui-backend:[TAG]
docker run --name=instana-ui-backend --user=996:0 --env=COMPONENT_ID=ui-backend --env=COMPONENT_LOGLEVEL=Info --env='HEAP_OPTS=-Xss265k -Xms2992M -Xmx2992M' --env=GC_THREADS=4 --env=IMPORT_TLS_PATH=/etc/secrets --env=JVM_OPTS=-Dcom.redhat.fips=false --volume=/root/.instana/etc/instana/ui-backend/logback.xml:/etc/instana/ui-backend/logback.xml:ro,z --volume=/var/log/instana/instana/ui-backend:/var/log/instana/ui-backend:z --volume=/root/cert/tls.key:/etc/secrets/tls.key:ro,z --volume=/root/cert/tls.crt:/etc/secrets/tls.crt:ro,z --volume=/root/.instana/etc/instana/ui-backend/config.yaml:/etc/instana/ui-backend/config.yaml:ro,z --network=instana -p 127.0.0.1:8080:8600 -p 127.0.0.1:9991:8601 -p 127.0.0.1:8602:8602 --restart=on-failure:10 --label='version=265' --label='application=instana' --label='component=instana-ui-backend' --label='group=service' --runtime=runc --detach=true artifact-public.instana.io/backend/ui-backend:3.265.264-0

