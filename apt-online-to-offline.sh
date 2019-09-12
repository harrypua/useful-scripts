#ONLINE
#maybe need to sudo rm -rf /var/cache/apt
#and apt-get update

URLS=$(sudo apt-get install vim --print-uris -qq | sed -n "s/'\([^ ]\+\)' \([^ ]\+\) \([^ ]\+\) MD5Sum:\([^ ]\+\)/ \1/p")

for URL in $URLS
do
  axel $URL
done

#OFFLINE
sudo dpkg -i *.deb