# vagrant-openstack-image-builder

## Requirements


### Platforms
- CentOS 7.2

### Chef
- Chef 12.10 or later

## Attributes
Generally used attributes. See attributes/default.rb.  
Attribute prefix is `node['openstack-image']`.

|Key|Type|Description|Default|
|:--|:---|:----------|:------|
|['location_url']|String|The url which download CentOS.|http://ftp.iij.ad.jp/pub/linux/centos/7/os/x86_64/|
|['instance_name']|String|Instance name for build. It also used as output filename.|centos-7.2|
|['image_format']|String||qcow2|
|['virt_type']|String|qemu or kvm.|qemu|
|['kickstart_file']|String|The kickstart file path.|/var/www/html/ks.cfg|

## Usage
Just include `openstack-image` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openstack-image]"
  ]
}
```

Login as root.  

```
# /root/build.sh
```
