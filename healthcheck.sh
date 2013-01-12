#!/bin/bash

# get our restart command and the ports
# to talk with cgminer on
source health.conf


# loop through our ports for when we have multiple
# cgminer instances on this machine
for x in "${ports[@]}"
do

  # send the "devs" command to cgminer to see
  # if any device are dead. if so, run
  # the restart command from the config
  if echo "devs|" | nc localhost "$x" | grep -i "dead";
    then eval "$restartcmd"
  fi
done