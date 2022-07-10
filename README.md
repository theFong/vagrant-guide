# Vagrant Guide

### Warning: this guide uses an [un-maintained, abandoned plugin]( https://github.com/mitchellh/vagrant-aws/issues/24)

## Run

`make generate`

`vagrant up`

`vagrant ssh`

`vagrant destroy`

## Configure AWS Auth and Region

Vagrant is setup to use the aws profile found in `~/.aws/config` & `~/.aws/credentials` to determine certs and region defaults (Note: the config file must be present). The default profile is `default`. You can change the profile by passing in a different value for `aws_profile` terraform variable.