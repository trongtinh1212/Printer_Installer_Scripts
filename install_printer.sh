#!/usr/bin/env bash

# cd to current path
BASE_PATH=$(
  cd $(dirname "$0");
  pwd
)

# IP Printer
IP1="IP" 
IP2="IP" 
IP3="IP"


# Printer name
Printer_Name1="printer_hostname"
Printer_Name2="printer_hostname"
Printer_Name3="printer_hostname"

# Driver path
Driver_Path="/Library/Printers/PPDs/Contents/Resources/FF Print Driver for Mac OS X.gz"

# check run as root - should run as root while install the printer
if [ "$EUID" -ne 0 ]; then
  echo -e "[-] Please run as root."
  echo -e "    eg. sudo "
  exit 3
fi

# Driver installer path
Driver_Installer="./FUJIFILM_Print_Driver_MacOSX_Installer.pkg"
installer -pkg $Driver_Installer -target /
sleep 5

PS3='Please enter your choice: '
options=("$Printer_Name1" "$Printer_Name2" "$Printer_Name3" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "$Printer_Name1")
            echo "you chose to install $IP1"
            if lpstat -s | grep $IP1 ; then
	            echo "VERIFIED: Printer $IP1 is installed"
            else
                echo "Installing Printer $Printer_Name1 Driver"
	            echo "Installing Printer $Printer_Name1"
	            sleep 3
                # Delete driver package file after install
	            #rm ./FUJIFILM_Print_Driver_MacOSX_Installer.pkg
	            lpadmin -p $Printer_Name1 -D "$Printer_Name1" -v lpd://$IP1/ -P "${Driver_Path}" -o printer-is-shared=false -E
            fi
            ;;


        "$Printer_Name2")
            echo "you chose to install $IP2"
            if lpstat -s | grep $IP2 ; then
	            echo "VERIFIED: Printer $IP2 is installed"
            else
                echo "Installing Printer $Printer_Name2 Driver"
	            echo "Installing Printer $Printer_Name2"
	            sleep 3
                # Delete driver package file after install
	            #rm ./FUJIFILM_Print_Driver_MacOSX_Installer.pkg
	            lpadmin -p $Printer_Name2 -D "$Printer_Name2" -v lpd://$IP2/ -P "${Driver_Path}" -o printer-is-shared=false -E
            fi
            ;;


        "$Printer_Name3")
            echo "you chose to install $IP3"
            if lpstat -s | grep $IP3 ; then
	            echo "VERIFIED: Printer $IP3 is installed"
            else
                echo "Installing Printer $Printer_Name3 Driver"
	            echo "Installing Printer $Printer_Name3"
	            sleep 3


            # Delete driver package file after install
	        rm ./$Driver_Installer
        
            # Reference link : https://github.com/apple/cups
            
	        lpadmin -p $Printer_Name3 -D "$Printer_Name3" -v lpd://$IP3/ -P "${Driver_Path}" -o printer-is-shared=false -E
            fi
            ;;

        "Exit")
            break
            ;;

            
        *) echo "invalid option $REPLY";;
    esac
done