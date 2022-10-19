Цель: развернуть двунодовый кластер `clickhouse`, на первой ноде (`10.110.0.3`) также должен быть установлен `zookeeper`. Конфигурация кластера - один шард, две реплики:
```xml
<clickhouse>
  <clickhouse_remote_servers>
    <local>
      <shard>
        <internal_replication>true</internal_replication>
        <replica>
          <host>10.110.0.3</host>
          <port>9000</port>
        </replica>
        <replica>
          <host>10.110.0.2</host>
          <port>9000</port>
        </replica>
      </shard>
    </local>
  </clickhouse_remote_servers>
  <zookeeper-servers>
    <node index="1">
      <host>10.110.0.3</host>
      <port>2181</port>
    </node>
  </zookeeper-servers>
  <macros>
    <cluster>local</cluster>
    <shard>1</shard>
    <replica>10.110.0.2</replica>
  </macros>
</clickhouse>
```
Здесь `10.110.0.0/20` - подсеть второго интерфейса eth1.

На что потратил много времени:
- в `/etc/hosts` нужно прописать все ноды кластера, иначе на одной из нод в логе появится ошибка
```
DB::Exception: Not found address of host: ch1.4e4d4ea7486f847edb276924de2317dc. (DNS_ERRO
R), Stack trace (when copying this message, always include the lines below):
```
и данные не смогут реплицироваться