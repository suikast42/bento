#!/bin/sh -eux

echo 'PubkeyAcceptedKeyTypes=+ssh-rsa' >> /etc/ssh/sshd_config
systemctl restart sshd