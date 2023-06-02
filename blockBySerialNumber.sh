#!/bin/bash
blockedSN=(SN1 SN2 SN3 C02ZV2HWMD6M SN4 SN5)
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
