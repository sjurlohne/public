#!/bin/bash

# Using this script you can preform an action for each "serial"
# The variable can of course be anything, in this example it's a serial.

blockedSN=(SN1 SN2 SN3 SN4 SN5 SN6)
SerialNumber=$(ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}')
serialFOUND=0
for E in ${blockedSN[@]}
do  [ "$SerialNumber" = "$E" ] && serialFOUND=1
done
echo $serialFOUND

if [ $serialFOUND = "1" ]; then

echo "Serial is blocked"

else

echo "Serial is NOT blocked"

fi
