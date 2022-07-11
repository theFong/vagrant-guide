require 'vagrant-aws'
Vagrant.configure('2') do |config|
  config.vm.box = 'dummy'
  config.vm.provision "shell", path: ".brev/setup.sh"
  config.vm.provider 'aws' do |aws, override|
    aws.keypair_name = 'vagrant-guide-ssh-key'
    aws.instance_type = 't2.micro'
    aws.ami = 'ami-040a251ee9d7d1a9b'
    aws.aws_profile = 'default'
    aws.security_groups = ['vagrant-guide']
    override.ssh.username = 'ubuntu'
    override.ssh.private_key_path = 'keys/vagrant-guide-ssh-key.pem'
  end
end