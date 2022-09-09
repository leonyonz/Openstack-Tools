#!/bin/bash

# Init Var
region=$(openstack region list -c Region -f value |awk '{print $1}')
today=$(date +%d);
yesterday=$(($today - 1)) 

# Get Email
echo ""
read -p "Masukan Email : " email

# Get Project
proid=$(openstack role assignment list --user-domain neo.id --user $email -c Project -f value)
proname=$(openstack project show $proid -c name -f value)

# Get Server Total
srvtot=$(openstack limits show --absolute  --project $proid -c Name -c Value -f value |grep "totalInstancesUsed" |awk '{print $2}')

#Get CPU
cputot=$(openstack limits show --absolute  --project $proid -c Name -c Value -f value |grep "totalCoresUsed" |awk '{print $2}')

#Get RAM
ramtot=$(openstack limits show --absolute  --project $proid -c Name -c Value -f value |grep "totalRAMUsed" |awk '{print $2}')

# Get NBS Total
nbstot=$(openstack volume list --project $proid --long -c Name -c Type -f value |grep "NBS"|wc -l)

# Get NHP Total
nhptot=$(openstack volume list --project $proid --long -c Name -c Type -f value |grep "NHP"|wc -l)

# Get LB
lbtot=$(neutron lbaas-loadbalancer-list --tenant_id $proid -c name -f value |wc -l)

# Get Plesk Bundle
plesk=$(openstack stack list -c "Stack Name" -c Project -f value |grep $proid |wc -l)

# Get Disk All
stor=$(openstack resource usage show --os-placement-api-version 1.9 $proid -c resource_class -c usage -f value |grep "DISK"|awk '{print $2}')
nbsvol=$(cinder quota-usage $proid |grep -w "gigabytes_NBS" |head -1 | awk '{print $4}')
nhp10k=$(cinder quota-usage $proid |grep -w "gigabytes_NHP 10K IOPS"  | awk '{print $6}')
nhp15k=$(cinder quota-usage $proid |grep -w "gigabytes_NHP 15K IOPS"  | awk '{print $6}')
nhp5k=$(cinder quota-usage $proid |grep -w "gigabytes_NHP 5K IOPS"  | awk    '{print $6}')

disk=$(($stor + $nbsvol + $nhp5k + $nhp10k + $nhp15k))

# Output
echo -e "Object\t\t\tValue"
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "Email\t\t\t$email"
echo -e "Project ID\t\t$proid"
echo -e "Project Name\t\t$proname"
echo -e "Region\t\t\t$region"
echo -e "CPU Usage\t\t$cputot"
echo -e "RAM Usage\t\t$ramtot"
echo -e "Total NBS Usage GB\t$nbsvol"
echo -e "Total NHP5k Usage GB\t$nhp5k"
echo -e "Total NHP10k Usage GB\t$nhp10k"
echo -e "Total NHP15k Usage GB\t$nhp15k"
echo -e "Total Disk GB\t\t$disk"
echo -e "Total Instance\t\t$srvtot"
echo -e "Jumlah Storage NBS\t$nbstot"
echo -e "Jumlah Storage NHP\t$nhptot"
echo -e "Total LB\t\t$lbtot"
echo -e "Plesk Bundle\t\t$plesk"