require 'vagrant-aws'
Vagrant.configure('2') do |config|
  config.vm.box = 'dummy'
  config.vm.provision "shell", path: ".brev/setup.sh"
  config.vm.provider 'aws' do |aws, override|
    aws.instance_type = 't2.micro'
    aws.ami = 'ami-040a251ee9d7d1a9b'
    aws.security_groups = ['example-name']
    override.ssh.username = 'ubuntu'
  end
end