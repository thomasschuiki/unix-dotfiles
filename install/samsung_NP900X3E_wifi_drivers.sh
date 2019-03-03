# for debian 9 stretch
#install wifi drivers

#check what network controller we have:
lspci -knn | grep Net

#Add a "non-free" component to /etc/apt/sources.list, for example:

# Debian 9 "Stretch"
# deb http://httpredir.debian.org/debian/ stretch main contrib non-free

# Update the list of available packages and install the firmware-iwlwifi package:

# apt-get update && apt-get install firmware-iwlwifi

#As the iwlwifi module is automatically loaded for supported devices, reinsert this module to access installed firmware:

# modprobe -r iwlwifi ; modprobe iwlwifi


#####
# Error:
# Possible missing firmware /lib/firmware/rtl_nic/rtl8107e-2.fw for module r8169

# install realtek firmware
apt install firmware-realtek
