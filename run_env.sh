################################################
# SYNNEX International Technology Corp.
# General Device Monitor with Azure IoT Hub
# henryhuang@synnex-grp.com
################################################
#!/bin/bash
# set the STRING variable
 export IOTHUB_DEVICE_SECURITY_TYPE="DPS"
 export IOTHUB_DEVICE_DPS_ENDPOINT="DeltaIothubDPS.azure-devices-provisioning.net"
 export IOTHUB_DEVICE_DPS_ID_SCOPE="0ne002F086D"
 export IOTHUB_DEVICE_DPS_DEVICE_ID="delta-device-00003"
 export IOTHUB_DEVICE_DPS_DEVICE_KEY="f8/EGeB+1qHMsa9E/IRZMbSuy9yByJZs27OxNDr+RWde9BZNYLyuJnRb7s1asthRwB/jXjgOa0cjqUq/0Pc7+g=="
 export IOTHUB_DEVICE_CONNECTION_STRING=""
#export KEYPAD_INTERRUPT="DISABLE"
 export KEYPAD_INTERRUPT="ENABLE"

# print the contents of the variable on screen
echo $IOTHUB_DEVICE_SECURITY_TYPE
echo $IOTHUB_DEVICE_DPS_ENDPOINT
echo $IOTHUB_DEVICE_DPS_ID_SCOPE
echo $IOTHUB_DEVICE_DPS_DEVICE_ID
echo $IOTHUB_DEVICE_DPS_DEVICE_KEY
echo $IOTHUB_DEVICE_CONNECTION_STRING
echo $KEYPAD_INTERRUPT

SomeOneDir=`pwd`
echo $SomeOneDir
Excution=${SomeOneDir}"/pnp_simple_thermostat"
echo $Excution
$Excution