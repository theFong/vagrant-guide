require 'vagrant-aws'
Vagrant.configure('2') do |config|
  config.vm.box = 'dummy'
  config.vm.provision "shell", path: ".brev/setup.sh"
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "/tmp/id_rsa"
  config.vm.provision "shell", inline: "mv /tmp/id_rsa .ssh/id_rsa && rm -rf /tmp/id_rsa"
  config.vm.provider 'aws' do |aws, override|
    aws.keypair_name = 'my-example-ssh-key'
    aws.instance_type = 't2.micro'
    aws.ami = 'ami-040a251ee9d7d1a9b'
    aws.aws_profile = 'default'
    aws.security_groups = ['my-example']
    override.ssh.username = 'ubuntu'
    override.ssh.private_key_path = 'keys/my-example-ssh-key.pem'
  end
end