Цель: прописать в конфигурационном файле `/etc/clickhouse-server/config.xml` следующие настройки для экспорта метрик в формате `prometheus`:
- порт 9363
- только таблицы metrics и events

Проверить эндпоинт `http://localhost:9363/metrics`
