Цель: развернуть на двух ВМ clickhouse, в файле /etc/clickhouse-server/cluster.xml описать конфигурацию кластера с 2-мя шардами по 1-й реплике в каждом.
В кластере создать локальные и distributed таблицы на каждой ноде. Добавить 5 записей в каждую локальную таблицу, убедиться, что в распределенной таблице отображается 10 записей.


На что потратил много времени:
- тэг `include_from` вкладывается в `clickhouse`, в нем указывается файл (`/etc/clickhouse-server/cluster.xml`), который содержит описание кластера
- информация о том, что перечитывается файл с конфигурацией кластера `/etc/clickhouse-server/cluster.xml` есть только в `/var/log/syslog`, ожидал увидеть в логах сервера `/var/log/clickhouse-server/clickhouse-server.log`
- чтобы применился файл `/etc/clickhouse-server/cluster.xml` необходимо рестартовать демон