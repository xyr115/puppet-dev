# Build, Test, Deploy Puppet Modules
Standardized development of Puppet Modules

# Getting Started / Requirements
  * As of 10/1/18: Both vagrant 2.1.x are compatible
  * Requires an installation of virtualbox and Oracle_VM_VirtualBox_Extension_Pack-5.0.40-115130.ova
  * Installation of RVm using Ruby 2.5.1 (Other rubies not currently tested, please up this as needed)
  * Installation of vagrant plugins:
    * vagrant-hostmanager (1.8.9, global)
    * vagrant-vbguest (0.15.2, global)
  
# Notice: do not run vagrant up without...
Verifying/editing the vagrantfile code for memory provisioning related functions 
If you only have 16Gb locally, it will crash your machine
Ideally, you only need one server and two clients—e.g. 
    $ vagrant up puppet analyst operations

# The following get installed:
* CentOS PuppetServer (Puppet 4 by default, but 5 is on a branch)
* CentOS Puppet Agent
* Debian Puppet Agent
* Windows 2012 Eval Agent

# Known Issues
* On Mac Sierra errors are thrown when vagrant up is invoked that relate to ip errors, let the installation run, then it corrects

* Puppet runs fail or eyaml does not parse: It's best to rebuild all boxes together, making non-breaking changes issuing vagrant reload --provision [some box] 
