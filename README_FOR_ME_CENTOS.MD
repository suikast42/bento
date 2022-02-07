# Build centos image
1. cd packer_templates/centos
2. For more vmware iso configs [see docu](https://www.packer.io/docs/builders/vmware/iso) 
Open powershell
```shell
 $env:PACKER_CACHE_DIR="$env:userprofile\VMImages\VMIsos\centos_8_5"
 packer build -only=vmware-iso -var "disk_size=16384"   centos-8.5-x86_64.json
```
4. change to <project basedir>/build  and rename the box as amova-centos8-baseimg-<amova version>.<disk size>.vmwarevm
   for example amova-centos8-baseimg-4.2.0.16.vmwarevm
5. 
```shell
openssl sha1  amova-centos8-baseimg-4.2.0.16.vmwarevm
```
6. Add the version and sha to metadata.json and upload it 

# Troubleshooting 
1. vmware-iso: Error detecting host IP: Unable to find host IP from devices [vmnet8], last error: No host declarations containing vmnet8 found”
   Configuring VMnet8 back to its default settings (NAT) in the vmware virtual network editor [see](https://github.com/rapid7/metasploitable3/issues/410)