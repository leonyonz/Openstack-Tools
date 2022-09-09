#a=$(openstack project list | grep -w 75601 | awk '{print$2}')
#b=$(openstack user list --project $a | grep l2@biznetgio.com | awk '{print$2}')
a=$(openstack user list --domain neo.id | grep l2@biznetgio.com | awk '{print$2}')
printf "\n"
read -p "Input Project ID Customer : " projectcustomer

c=$(openstack project list | grep -w $projectcustomer | awk '{print$2}')

openstack role remove --user $a --project $c Member
printf "\n"
echo "Project Customer Already Removed from l2@biznetgio.com User"

