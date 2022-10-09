#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cat << EOF > temp_start.sh
ansible-galaxy install -r requirements.yml
ansible-playbook  -i inventories/rbr deploy_clickhouse.yml 
EOF

chmod +x temp_start.sh

docker run --rm -it \
		-e ANSIBLE_STRATEGY_PLUGINS=/usr/lib/python3.8/site-packages/ansible_mitogen/plugins/strategy \
		-e ANSIBLE_STRATEGY=mitogen_linear \
		-e ANSIBLE_HOST_KEY_CHECKING=False \
		-e USER=ansible \
  		-e MY_UID=1000 \
  		-e MY_GID=1000 \
		-v ${SCRIPT_DIR}:/data \
		-v ${HOME}/.ssh/:/home/ansible/.ssh/ \
		cytopia/ansible:2.11-tools /data/temp_start.sh

rm temp_start.sh
echo "run 'forkstat -e all -S' in case of any problems"