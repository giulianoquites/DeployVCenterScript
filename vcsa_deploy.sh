ISO=$1
JSON=$2
if [-z $ISO ] || [ -z $JSON ]; then
   echo "usage:  $0 <iso_filename> <vcsa_json_template_file>" >&2
   exit 1
fi
/vms/isos/gquites/vcsa/uniso.sh ${ISO}
pushd y/vcsa-cli-installer/lin64
./vcsa-deploy install --no-ssl-certificate-verification --accept-eula /vms/isos/gquites/vcsa/${JSON}
popd
[ -d y ] && sudo rm -fr y
