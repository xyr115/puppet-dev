#!/bin/sh
#####################################
# yum proxy for vagrant
# (for RHEL/CentOS 7.x)
#####################################
# install needed packages

yum -y install createrepo httpd yum-utils

# create repo directory
reponame=xyrepo
repodir=/var/www/html/xyrepo
mkdir -p $repodir

# download packages
if [ $# -gt 0 ]; then
yumdownloader $@ --destdir=$repodir --resolve
fi

# create repository and publish to the web
sudo createrepo --simple-md-filenames $repodir
systemctl enable httpd
systemctl start httpd

# get ip address (inside this script!)

#static assigned from second interface
# ipaddr=`ip a | grep eth1 | grep inet | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}'`

#dynamic assigned from the primary interface
ipaddr=`ip addr show dynamic primary | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}'`


# set proxy if it is defined in vagrant host
if [ -v HTTP_PROXY ]; then
cat >> /etc/environment <<EOL
HTTP_PROXY=$HTTP_PROXY
HTTPS_PROXY=$HTTPS_PROXY
EOL
fi

#===============================Create the repo file==================================

sudo mkdir /etc/yum.repos.d/org
sudo mv /etc/yum.repos.d/CentOS* /etc/yum.repos.d/org

cat > /etc/yum.repos.d/XYR.repo <<EOL
[XYR-Local-Repo]
name=Xyr Local Repo
baseurl=http://$ipaddr/$reponame
gpgcheck=0
enabled=1
EOL

yum clean all

#===============================Updater Script Section==================================

# create updater script
cat > yumupdate.sh <<EOL
echo "sudo yumdownloader \$@ --destdir=$repodir --resolve"
sudo yumdownloader \$@ --destdir=$repodir --resolve
sudo createrepo --update $repodir
EOL
chmod +x yumupdate.sh

# set motd
cat > /etc/motd <<EOL
========================================================================
Yum Repository Server
$(cat /etc/redhat-release)

To use this repository:
export YUM_URL=http://$ipaddr/xyrepo

To add the package, do:
$ ./yumupdate.sh package1 package2 ...

then in each yum client:
$ sudo yum clean all
========================================================================
EOL

# notify
cat /etc/motd
