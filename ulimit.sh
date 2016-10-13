!/bin/bash
#Script made for MooFwd Portal installtion
#Author: Vinod.N K
#Usage: OpenSSL, Gcc, for Ulimit Updation
#Distro : Linux -Centos, Rhel, and any fedora
#Check whether root user is running the script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
# Installing needed dependencies and setting ulimit
sudo yum install gcc openssl openssl-devel pcre-devel git unzip -y
sed -i -e '/# End of file/d' /etc/security/limits.conf
echo "* soft    nofile  99999
*       hard    nofile  99999
*       soft    noproc  20000
*       hard    noproc  20000
# End of file" >> /etc/security/limits.conf
sudo sysctl -w fs.file-max=6816768
sudo sysctl -p
rm -rf ulimit.sh
