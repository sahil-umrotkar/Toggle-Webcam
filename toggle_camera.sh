#!/bin/bash

sudo mount -uw /

IFS= read -r line < status.txt

if [[ $1 == -d ]]
then
	if [[ $line == "n" ]]; then
		echo 'System camera is already disabled'
	else
		sudo chmod a-rwx /System/Library/Frameworks/CoreMediaIO.framework/Versions/A/Resources/AppleCamera.plugin
		echo -e "\nSystem Camera disabled\n"
		sed -i '.bak' 's/y/n/' status.txt
	fi

else
	if [[ $line == "y" ]]; then
		echo 'System Camera is already enabled'
	else 
		sudo chmod a+rwx /System/Library/Frameworks/CoreMediaIO.framework/Versions/A/Resources/AppleCamera.plugin
		echo -e "\nSystem Camera enabled\n"
		sed -i '.bak' 's/n/y/' status.txt
	fi
fi