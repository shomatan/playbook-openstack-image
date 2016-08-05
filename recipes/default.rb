#
# Cookbook Name:: openstack-image
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{
  virt-viewer
  qemu-kvm
  libvirt
  virt-manager
  virt-install
  libguestfs-tools }.each do |pkg|
  package pkg do
    action :upgrade
  end
end

service "libvirtd" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

image_format = node['openstack-image']['image_format']
instance_name = node['openstack-image']['instance_name']
tmp_file = "/tmp/#{instance_name}.#{image_format}"

template "/tmp/ks.cfg" do
  sensitive true
end

template "/root/build.sh" do
  mode 0755
  variables(
    :instance_name => instance_name,
    :tmp_file => tmp_file,
    :output_file => "/var/www/html/#{instance_name}.#{image_format}",
    :format => image_format,
  )
  sensitive true
end
