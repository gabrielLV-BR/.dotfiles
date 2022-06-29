#!/bin/sh

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

echo "--- ATUALIZANDO REGISTRO ---"

#pacman -Syyu

echo "--- INSTALANDO PROGRAMAS ---"

PROGRAMAS=(
	gcc cmake vim python python-pip terminator neofetch htop zsh
)

for PROGRAMA in ${PROGRAMAS[@]}; do
	echo "	- INSTALANDO $PROGRAMA"
#	pacman -S $PROGRAMA	
done

echo "--- ATUALIZANDO PATH ---"

bash $HOME/.bashenv
bash $HOME/.bashrc

echo "--- TESTANDO PROGRAMAS ---"


for PROGRAMA in ${PROGRAMAS[@]}; do
	which $PROGRAMA 2> ErrorLog.log || {
		echo -e "$PROGRAMA - $On_Red ERRO! $Color_Off"
		break
	} && {
		echo -e "$PROGRAMA - $On_Green OK. $Color_Off "
	}
done

echo "--- TROCAR SHELL PADRÃO PARA ZSH? ---"
read -p "[s/N] " RESPOSTA

if [[ $RESPOSTA == "S" || $RESPOSTA == "s" ]]
then
	sudo chsh $USER $(which zsh)
fi
