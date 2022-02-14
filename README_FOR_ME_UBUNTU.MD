# Links

* [tekanaid.com](https://tekanaid.com/posts/hashicorp-packer-build-ubuntu20-04-vmware)
* [packer.io](https://www.packer.io/guides/automatic-operating-system-installs/preseed_ubuntu)
* [ubuntu proxmox](https://www.aerialls.eu/posts/ubuntu-server-2004-image-packer-subiquity-for-proxmox/)
* [google serach](https://www.google.com/search?q=pakcer+ubuntu+vmware+builder&rlz=1C1GCEB_enDE988DE988&oq=pakcer+ubuntu+vmware+builder&aqs=chrome..69i57j0l2.7311j0j7&sourceid=chrome&ie=UTF-8)
# Build centos image
1. cd packer_templates/ubuntu
Open powershell
```shell
 $env:PACKER_CACHE_DIR="$env:userprofile\VMImages\VMIsos\ubuntu"
 $env:PACKER_LOG=1
 packer build -only=vmware-iso -var "disk_size=16384"  ubuntu-20.04-amd64.json
```

4. change to <project basedir>/build  and rename the box as amova-centos8-baseimg-<amova version>.<disk size>.vmwarevm
   for example amova-ubuntu-baseimg-4.2.0.16.vmwarevm
5. 
```shell
openssl sha1  amova-ubuntu-baseimg-4.2.0.16.vmwarevm
```
6. Add the version and sha to metadata.json and upload it 

# Troubleshooting 
1. vmware-iso: Error detecting host IP: Unable to find host IP from devices [vmnet8], last error: No host declarations containing vmnet8 found”
   Configuring VMnet8 back to its default settings (NAT) in the vmware virtual network editor [see](https://github.com/rapid7/metasploitable3/issues/410)