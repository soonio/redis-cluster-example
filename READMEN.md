# redis 集群搭建

# 获取本机Ip

```bash
work@imac redis-cluster % ifconfig | grep 192
        inet 192.168.0.115 netmask 0xffffff00 broadcast 192.168.0.2
```

## 修改配置
 1. 修改 template.conf 中 `cluster-announce-ip 192.168.0.115`
 2. redis-cli 命令中节点的ip 为192.168.0.115

# 启动
```bash
# 生成配置文件
./gen.sh

# 启动redis服务
docker-compose up -d

# 进入容器
docker exec -it redis1 bash

# 在容器中执行
redis-cli -p 7001 -a redispwd --cluster create \
  192.168.0.115:7001 \
  192.168.0.115:7002 \
  192.168.0.115:7003 \
  192.168.0.115:7004 \
  192.168.0.115:7005 \
  192.168.0.115:7006 \
  --cluster-replicas 1

# 等待集群启动
```

## todo 使用别名模式会出现 `Waiting for the cluster to join`