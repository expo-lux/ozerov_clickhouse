ansible-galaxy install -r requirements.yml
ansible-playbook  -i inventories/rbr deploy_clickhouse.yml 
