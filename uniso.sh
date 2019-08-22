ISOFNAME=$1
if [ -z $ISOFNAME ]; then
   echo "usage:  $0 <iso_filename>" >&2
   exit 1
fi
[ -d z ] || mkdir z
sudo mount -o loop ${ISOFNAME} z
[ -d y ] && rm -fr y; mkdir y
shopt -s dotglob
rsync -avz z/* y
shopt -u dotglob
[ -d z ] && sudo umount z && rmdir z
