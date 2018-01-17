#!/bin/bash
BLUE='\e[0;34m';
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
ENDCOLOR='\e[0m'
YELLOW='\e[0;93m'
source ~/.git-prompt.sh
__git (){
if [ -z $(__git_ps1)] >  /dev/null 2>&1
then
        echo " "
	else
	        echo -e " $BROWN[GIT]$ENDCOLOR -$CYAN$(__git_ps1)$ENDCOLOR "
		fi
		}
