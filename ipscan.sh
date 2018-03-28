#! /bin/bash
# Tool to enumerate hosts, and then portscan the results
# Developed by Fray117 & ReyhanAF
 
# TARGET
echo "Enter the address range (192.168.x.x):"
read target
 
#  OUTPUT
echo "Enter a description for target:"
read name
 
#Create scan results directory.
mkdir $name
 
# START NMAP SCAN
echo "*****************************"
echo "* Starting Host Enumeration *"
echo "*****************************"
sudo nmap -sP $target | grep Host | awk -F" " '{ print $2 }' > ./$name/hosts.$name
 
echo "Scan Finished. Output saved as ./$name/hosts.$name"
 
   # START PORTSCAN
   echo "******************"
   echo "* SCANNING PORTS *"
   echo "******************"
   exec<./$name/hosts.$name
   value=0
   while read line
   do
            sudo nmap -sS $line > ./$name/$line.nmap
        echo "$line.nmap written."
   done
 echo ""
 echo "Portscans finished.  Output can be found in ./$name/"
