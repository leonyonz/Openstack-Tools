#a=$(openstack project list | grep -w 75601 | awk '{print$2}')
#b=$(openstack user list --project $a | grep l2@biznetgio.com | awk '{print$2}')
echo "Batch Role Removed Tools"
echo "------------------------"
echo "Jangan lupa gunakan Admin RC Sesuai Project !"
printf "\n"
read -p "Input Project Name Customer (spasi sebagai pemisah) : " projectcustomer

for db in $projectcustomer
do
  echo $db;
  c=$(openstack project list | grep -w $db | awk '{print$2}')
  openstack role remove --user l2@biznetgio.com --user-domain neo.id --project $c Member
  echo "Removed!"
  echo "";
done

printf "\n"
echo "All Project Customer Already Removed from l2@biznetgio.com User"

