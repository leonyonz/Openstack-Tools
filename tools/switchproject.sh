printf "\n"

read -p "Masukkan Akun Email Asal : " email1

read -p "Masukkan Akun Email Pengganti : " email2

idemaila=$(openstack user list --domain neo.id -f value | grep $email1 | awk '{print$1}')
idemailb=$(openstack user list --domain neo.id -f value | grep $email2 | awk '{print$1}')
projectemaila=$(openstack role assignment list --user $idemaila -c Project -f value)
projectemailb=$(openstack role assignment list --user $idemailb -c Project -f value)
printf "\n"

echo "Before"
echo "-----------------------------"

printf "\n"

echo $email1
echo "ID User : " $idemaila
echo "Project ID : " $projectemaila

printf "\n"

echo $email2
echo "ID User : " $idemailb
echo "Project ID : " $projectemailb


openstack role add --user $idemailb --project $projectemaila Member
openstack role add --user $idemaila --project $projectemailb Member
openstack role remove --user $idemaila --project $projectemaila Member
openstack role remove --user $idemailb --project $projectemailb Member

idemaila1=$(openstack user list --domain neo.id -f value | grep $email1 | awk '{print$1}')
idemailb1=$(openstack user list --domain neo.id -f value | grep $email2 | awk '{print$1}')
projectemaila1=$(openstack role assignment list --user $idemaila -c Project -f value)
projectemailb1=$(openstack role assignment list --user $idemailb -c Project -f value)

printf "\n"
echo "After"
echo "-----------------------------"
printf "\n"

echo $email1
echo "ID User : " $idemaila1
echo "Project ID : " $projectemaila1

printf "\n"

echo $email2
echo "ID User : " $idemailb1
echo "Project ID : " $projectemailb1

printf "\n"
echo "Silahkan di verifikasi kembali!!"
printf "\n"
#openstack user list --domain neo.id -f value | grep l2@biznetgio.com | awk '{print$1}'

#openstack role assignment list --user f3107fd19efa572e1188833b12c4893a2359319943ed1ec57d22f548c3a39972 -c Project -f value
