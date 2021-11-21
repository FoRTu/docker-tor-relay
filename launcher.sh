#!/bin/bash

ERROR='\033[0;31m'
WARNING='\033[0;33m'
GREEN='\033[0;32m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

echo -e "\n${MAGENTA}===============================${NC}"
echo -e "${MAGENTA}      TOR: RELAY + BRIDGE      ${NC}"
echo -e "${MAGENTA}===============================${NC}\n"
echo -e " · ${WARNING}Checking if required files exists...${NC}"
if [ ! -f "/etc/tor/torrc" ]; then
 echo -e " · ${ERROR}Configuration 'torrc' file not found!${NC}"
 echo " · Downloading template 'torrc' file..."
 curl --silent --output "/etc/tor/torrc" \
 "https://raw.githubusercontent.com/FoRTu/docker-tor-relay/master/torrc"
 if [ -f "/etc/tor/torrc" ]; then
  echo -e " · Configuration 'torrc' file has been downloaded. ${WARNING} Please customize the file with your info.${NC}  "
  echo -e " · ${WARNING}If something in the 'torrc' file isn't right, please open a new issue on https://github.com/FoRTu/docker-tor-relay please.${NC}"
 else
  echo -e " · ${ERROR}Something was wrong downloading the 'torrc' configuration file.${NC}"
  echo -e " · ${ERROR}Go to https://github.com/FoRTu/docker-tor-relay and download by yourself.${NC}"
  echo -e " · ${WARNING}If something in the 'torrc' file isn't right, please open a new issue on https://github.com/FoRTu/docker-tor-relay please.${NC}"
  exit 1
 fi
else
 echo -e " · ${GREEN}Everything is right, '/etc/tor/torrc' file exist${NC}"
fi

# Launch tor
echo -e "\n\n · ${GREEN}Launching TOR (Relay + Bridge)...${NC}\n"
tor -f "/etc/tor/torrc"

