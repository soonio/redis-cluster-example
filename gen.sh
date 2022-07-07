rm -rf ./singleton

for port in `seq 7001 7006`; do \
  mkdir -p ./singleton/${port}/conf \
  && PORT=${port} envsubst < ./template.conf > ./singleton/${port}/conf/redis.conf \
  && mkdir -p ./singleton/${port}/data; \
done

