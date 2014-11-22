from nodesource/node:precise
maintainer Adam Alpern <adm.alpern@gmail.com>

run apt-get update
run apt-get install -y python-pip python-dev curl git gunicorn supervisor

# Tessera
add ./config.py /var/lib/tessera/config.py

run	mkdir /src
run	git clone https://github.com/urbanairship/tessera.git /src/tessera
workdir	/src/tessera
run	pip install -r requirements.txt
run	pip install -r dev-requirements.txt
run	npm install -g grunt-cli
run	npm install
run	grunt
run	invoke db.init
run	invoke run & sleep 5 && invoke json.import 'demo/*.json'

# Supervisord
add	./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

expose :80

cmd	["/usr/bin/supervisord"]
