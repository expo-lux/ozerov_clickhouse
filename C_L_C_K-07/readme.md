Цель: обеспечить защищенное соединение между clickhouse-сервером и клиентом. Для этого необходимо сгенерировать самоподписанный сертификат, включить защищенные (настройки `https_port` и `tcp_port_secure`) и попробовать подключиться клиентом, при этом верификацию серверного сертификата необходимо отключить.