# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  # Kubernetes Master Server
  config.vm.define "kmasternode" do |kmasternode|
    kmasternode.vm.box = "centos/8"
    kmasternode.vm.hostname = "kmasternode.umaitek.dz"
    kmasternode.vm.network "private_network", ip: "172.16.16.100"
    kmasternode.vm.provider "libvirt" do |v|
      v.memory = 2048
      v.cpus = 2
      v.nested = true
      v.storage_pool_name = "default"
      v.storage :file, :size => '15G', :type => 'qcow2'
    end
    kmasternode.vm.provision "shell", path: "bootstrap_kmaster.sh"
  end

  # NodeCount = 2

  # # Kubernetes Worker Nodes
  # (1..NodeCount).each do |i|
  #   config.vm.define "kworkernode-#{i}" do |kworkernode|
  #     kworkernode.vm.box = "centos/8"
  #     kworkernode.vm.hostname = "kworkernode-#{i}.umaitek.dz"
  #     kworkernode.vm.network "private_network", ip: "172.16.16.10#{i}"
  #     kworkernode.vm.provider "libvirt" do |v|
  #       v.memory = 1024
  #       v.cpus = 1
  #       v.nested = true
  #     end
  #     kworkernode.vm.provision "shell", path: "bootstrap_kworker.sh"
  #   end
  # end

end
