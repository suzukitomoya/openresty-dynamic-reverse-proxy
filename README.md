# OpenResty 動的リバースプロキシのサンプル
OpenResty/Redis/Luaの組み合わせで、Hostに応じてupstreamを動的に変更するサンプル。

### Create upstream config in Redis
```shell
% docker-compose exec redis sh
# redis-cli
127.0.0.1:6379> hmset test1.example.com upstream "http://nginx:81"
OK
127.0.0.1:6379> hmset test2.example.com upstream "http://nginx:81"
OK
```

### Add to hosts
```
127.0.0.1 test1.example.com
127.0.0.1 test2.example.com
```