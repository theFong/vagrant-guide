
# generates priv/pub keys and sets up infra for vagrantfile. Also generates appropriated vagrant file given variables.
generate:
	cd terraform && terraform init && terraform apply

run-app:
	cd app && npm start

setup-app:
	cd app && npm i