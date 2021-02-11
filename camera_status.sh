#!/bin/bash

IFS= read -r line < status.txt

if [[ $line == "y" ]]; then
	echo -e "\nSystem camera is enabled\n"
else
	echo -e "\nSystem camera is disabled\n"
fi