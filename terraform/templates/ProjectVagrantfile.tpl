require 'vagrant-aws'
Vagrant.configure('2') do |config|
  config.vm.box = 'dummy'
  config.vm.provision "shell", path: ".brev/setup.sh"
  config.vm.provider 'aws' do |aws, override|
    aws.instance_type = '${instance_type}'
    aws.ami = '${ami}'
    aws.security_groups = ['${security_group}']
    override.ssh.username = '${ssh_username}'
  end
end