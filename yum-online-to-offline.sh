##### Online Machine
for PKG in "$@"
do
  #PKG=... # NAME OF THE PACKAGE TO INSTALL ON OFFLINE MACHINE
  yum install --downloadonly --installroot=/tmp/$PKG-installroot --releasever=7 --downloaddir=/tmp/$PKG $PKG
  createrepo --database /tmp/$PKG
  rm -rf /tmp/$PKG-installroot
  #rsync -arv /tmp/$PKG/ [IP of the machine]:/tmp/$PKG
  #can't rsync because airgap
done

##### Offline Machine
PKG=... # NAME OF THE PACKAGE
echo "[offline-$PKG]
name=CentOS-\$releasever - $PKG
baseurl=file:///tmp/$PKG/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" >  /etc/yum.repos.d/offline-$PKG.repo

# install package offline:
yum --disablerepo=\* --enablerepo=offline-$PKG install --nogpgcheck $PKG