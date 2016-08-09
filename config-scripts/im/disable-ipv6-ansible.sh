#!/bin/bash
# $1 -> Job workspace
WORKSPACE=$1

# Disable IPv6 in the test machines
var='    # Disable IPv6\n    - lineinfile: dest=/etc/sysctl.conf regexp="{{ item }}" line="{{ item }} = 1"\n      with_items:\n       - 'net.ipv6.conf.all.disable_ipv6'\n       - 'net.ipv6.conf.default.disable_ipv6'\n       - 'net.ipv6.conf.lo.disable_ipv6'\n      ignore_errors: yes\n    - shell: sysctl -p\n      ignore_errors: yes\n'
sed  -i "/tasks/a $var" $WORKSPACE/contextualization/conf-ansible.yml
