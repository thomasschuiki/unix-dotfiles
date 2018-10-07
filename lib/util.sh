##
# Check to see if the given application is installed.
#
# @param $1    The application to look for.
# @return      Exit code 0 if installed, otherwise 1.
#

function isInstalled {
	#echo -e "\ncheck if $1 is installed"
	type "$1" > /dev/null 2>&1 && return 0 || return 1
}

function install {
	apt install -y $1
}
