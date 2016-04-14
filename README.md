# Configuration Management 101

This is a complement to the [Getting Started with Configuration Management](https://www.digitalocean.com/community/tutorial_series/getting-started-with-configuration-management) series I wrote for DigitalOcean's community.

This repository contains the code examples from the configuration management tools Ansible, Puppet and Chef. It uses Vagrant to demonstrate these tools in practice.

## Requirements

To run these examples, you will need:

- [Vagrant](http://vagrantup.com)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

For the Ansible example, it is also necessary to install [Ansible](http://docs.ansible.com/ansible/intro_installation.html) on the host machine.

## Instructions

Clone this repository with:

```sh
git clone https://github.com/erikaheidi/cfmgmt.git
```

Choose the tool you want to test. Go to the directory and run `vagrant up`:

```sh
cd ansible
vagrant up
```

After the virtual machine is up and running, the provisioning process will start, and you will be able to follow the output in your terminal.

If you want to play around with the provisioning scripts, do the modifications and then run:

```sh
vagrant provision
```

This will execute the provisioning again and apply your changes. If you want to start from scratch, you should destroy the VM with:

```sh
vagrant destroy
```

And after that you can run `vagrant up` again to start from scratch.
