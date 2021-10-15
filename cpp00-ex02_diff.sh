#!/bin/bash

#define
RED="\033[31m"
GREEN="\033[32m"
RESET="\033[m"

EX02_EXEC="./test"

# execute
$EX02_EXEC > log

# clone attached log file
if [ ! -e "19920104_091532.log" ]; then
	curl -O https://projects.intra.42.fr/uploads/document/document/4666/19920104_091532.log
fi

# output diff
diff -y <(cat log | awk '{print $2}') <(cat 19920104_091532.log | awk '{print $2}')

# print result
if [ $? == 0 ]; then
	printf "${GREEN}OK :) ${RESET}\n"
else
	printf "${RED}KO :(${RESET}\n"
fi

# clean
rm log