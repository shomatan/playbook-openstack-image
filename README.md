# vagrant-openstack-image-builder
Build the CentOS image for openstack by vangrant + VirtualBox.

### Requirements
+ Vagrant
+ VirtualBox

### Playbook variables
|Key|Type|Description|Default|
|:--|:---|:----------|:------|
|location_url|String|The url which download CentOS.|http://ftp.iij.ad.jp/pub/linux/centos/7/os/x86_64/|
|instance_name|String|Instance name for build. It also used as output filename.|centos-7.2|
|image_format|String||qcow2|
|virt_type|String|qemu or kvm.|qemu|
|kickstart_file_path|String|The kickstart file path.|/var/www/html/ks.cfg|
|output_file_path|String||/var/www/{{ instance_name }}.{{ image_format }}|
|temp_file_path|String||/tmp/{{ instance_name }}.{{ image_format }}|

## Dependencies
None.

## Usage
