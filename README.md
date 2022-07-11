# Vagrant Guide

### Warning: this guide uses an [un-maintained, abandoned plugin](https://github.com/mitchellh/vagrant-aws/issues/579)

## Run

`make generate` 

`vagrant up --provision`

`vagrant ssh`

Within ssh shell:

`cd /vagrant && make setup-app run-app`

New ssh shell:

`curl localhost:3000`

Non-ssh(outer) shell:

`vagrant destroy`

## Configure AWS Auth and Region

Vagrant is setup to use the aws profile found in `~/.aws/config` & `~/.aws/credentials` to determine certs and region defaults (Note: the config file must be present). The default profile is `default`. You can change the profile by passing in a different value for `aws_profile` terraform variable. **Set the region in the aws profile as the same one you pass into terraform**. This is a limitation of the vagrant-aws plugin and terraform provider.


If you get this error message: `The image id '[ami-*]' does not exist (Fog::Compute::AWS::NotFound)` make sure to set the aws profile region value `~/.aws/config` as the same value thats passed into terraform.

## Security

Vagrant, by default, provisions a **public IP** for the ec2 instance. In this guide, **port 22 is exposed** to allow easy ssh access. The SSH server behind port 22 is secured with via a newly generated priv/pub key found in `/keys` but **a stronger security model may be desired** in certain scenarios.

## Dependencies
**Run `.brev/setup.sh` or use a Brev environment**
- Terraform Version v1.2.4
- Vagrant 2.2.19
- vagrant-aws (0.7.2, global)
- Requires a patch to the installed vagrant-aws plugin file `connect_aws.rb` since the [fix has not been merged and no release has been made](https://github.com/mitchellh/vagrant-aws/issues/566).
- Vagrant box: dummy (aws, 0)
