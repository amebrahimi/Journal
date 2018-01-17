# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
fi

alias sgp="sudo git pull"
alias vbp="vim ~/.bash_profile"
# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
source ~/.git-helper.sh

BLUE='\e[0;34m';
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
ENDCOLOR='\e[0m'
YELLOW='\e[0;93m'
export PATH
export PS1="$PURPLE[$ENDCOLOR$GREEN\u$ENDCOLOR@$CYAN\h$ENDCOLOR$PURPLE]$ENDCOLOR $BROWN-$ENDCOLOR $PURPLE[$ENDCOLOR\w$PURPLE]$ENDCOLOR $BROWN-$ENDCOLOR $PURPLE[$ENDCOLOR$BROWN\d \t$ENDCOLOR$PURPLE]$ENDCOLOR\n$PURPLE[$ENDCOLOR$RED\$$ENDCOLOR$PURPLE]$ENDCOLOR $PURPLE<($ENDCOLOR\$(__git)$PURPLE)>$ENDCOLOR "
