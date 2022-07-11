require 'vagrant-aws'
Vagrant.configure('2') do |config|
    config.vm.box = 'dummy'
    config.vm.provider 'aws' do |aws, override|
    aws.keypair_name = '${key_pair_name}'
    aws.instance_type = '${instance_type}'
    aws.ami = '${ami}'
    aws.aws_profile = '${profile}'
    aws.security_groups = ['${security_group}']
    override.ssh.username = '${ssh_username}'
    override.ssh.private_key_path = '${private_key_path}'
  end
end