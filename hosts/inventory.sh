#!/bin/sh

usage() {
  echo "Usage: inventory.sh --list | --host hostname"
  exit 1
}


case $1 in
  "--list")
    IP=`virsh net-dhcp-leases default | grep openstack | awk -F' ' '{print $5}' | cut -d '/' -f 1`
    echo {\"runner\":{\"hosts\":[\"$IP\"]}}
    ;;
  "--host")
    echo '{"ansible_ssh_user":"root","ansible_ssh_pass":"password"}'
    ;;
  *)
    usage
    ;;
esac
