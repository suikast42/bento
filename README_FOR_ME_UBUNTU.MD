# Links

* [tekanaid.com](https://tekanaid.com/posts/hashicorp-packer-build-ubuntu20-04-vmware)
* [packer.io](https://www.packer.io/guides/automatic-operating-system-installs/preseed_ubuntu)
* [ubuntu proxmox](https://www.aerialls.eu/posts/ubuntu-server-2004-image-packer-subiquity-for-proxmox/)
* [google serach](https://www.google.com/search?q=pakcer+ubuntu+vmware+builder&rlz=1C1GCEB_enDE988DE988&oq=pakcer+ubuntu+vmware+builder&aqs=chrome..69i57j0l2.7311j0j7&sourceid=chrome&ie=UTF-8)
# Differences from the upstream
## Changes in pkr-sources.pkr.hcl
- Added option ```disk_type_id```
## Changes in pkr-variables.pkr.hcl
- Changed  ```vmware_version``` from 19 to 15
- Added ```disk_type_id``` with default 0 (single dynamic disk)
- Changed  ```headless``` from true to false

# Build centos image
Disable Windows Firewall 
1. cd <project_dir>
Open powershell
```shell
 $env:PACKER_CACHE_DIR="$env:userprofile\VMImages\VMIsos\ubuntu"
 $env:TMPDIR="$env:C:\IDE\golang\tmp"
 $env:PACKER_LOG=1
 packer init -upgrade ./packer_templates
 packer build -only="vmware-iso.vm"  -var-file="os_pkrvars/ubuntu/ubuntu-22.04-x86_64.pkrvars.hcl" ./packer_templates
 #With custom disk size and type
 packer build -only="vmware-iso.vm" -var "disk_size=16384" -var="disk_type_id=0"   -var="disk_type_id=0"  -var-file="os_pkrvars/ubuntu/ubuntu-22.04-x86_64.pkrvars.hcl" ./packer_templates
```

4. change to <project basedir>/build  and rename the box as amova-ubuntu-baseimg-<amova version>.<disk size>.vmwarevm
   for example amova-ubuntu-baseimg-1.0.0.16.vmwarevm
5. 
```shell
openssl sha1  amova-ubuntu-baseimg-1.0.0.16.vmwarevm
```
6. Add the version and sha to metadata.json and upload it