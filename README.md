# Azure-IoTHub-Delta-device

# Connect SGDC-D45-SC01 device to your Azure IoT services

---
# Table of Contents

-   [Introduction](#Introduction)
-   [Prerequisites](#Prerequisites)
-   [Prepare the Device](#preparethedevice)
-   [Connect to Azure IoT Central](#ConnecttoCentral)
-   [Additional Links](#AdditionalLinks)

<a name="Introduction"></a>

# Introduction 

**About this document**

This document describes how to connect SGDC-D45-SC01 to Azure IoT Hub using the Azure IoT Explorer with certified device application and device models.

IoT Plug and Play certified device simplifies the process of building devices without custom device code. Using Solution builders can integrated quickly using the certified IoT Plug and Play enabled device based on Azure IoT Central as well as third-party solutions.

This getting started guide provides step by step instruction on getting the device provisioned to Azure IoT Hub using Device Provisioning Service (DPS) and using Azure IoT Explorer to interact with device's capabilities.

SGDC-D45-SC01 is designed as a gateway/site controller with LTE/Ethernet in WAN side for providing data acquisition from meters, PVS and PCS via Modbus protocol and forwarding data to energy management platform for further data processing and analysis. It also receives commands from energy management platform to achieve high energy efficiency and utilization and offers the control, configuration and network management functionality which can perform energy distribution control in local site. Besides, it provides DI/DO, CAN and 4-20mA current loop interfaces to detect and control devices for various related applications.


<a name="Prerequisites"></a>
# Prerequisites

You should have the following items ready before beginning the process:

**For Azure IoT Central**
-   [Azure Account](https://portal.azure.com)
-   [Azure IoT Central application](https://apps.azureiotcentral.com/)

**For Azure IoT Hub**
-   [Azure IoT Hub Instance](https://docs.microsoft.com/en-us/azure/iot-hub/about-iot-hub)
-   [Azure IoT Hub Device Provisioning Service](https://docs.microsoft.com/en-us/azure/iot-dps/quick-setup-auto-provision)
-   [Azure IoT Public Model Repository](https://docs.microsoft.com/en-us/azure/iot-pnp/concepts-model-repository)

<a name="preparethedevice"></a>
# Prepare the Device.

**Hardware Environmental setup**

- Prepare SGDC-D45-SC01.
- Connect the power adapter with SGDC-D45-SC01.
- Power on the SGDC-D45-SC01.
- Connect to the network.

**Software Environmental setup**

- Download the source code from this [GitHub](https://github.com/deltachance/Azure-IoTHub-Delta-device) and see the "Azure-IoTHub-Delta-device" folder.

**Prepare IoT Hub and DPS configuration**

Please refer to [this tutorial](https://docs.microsoft.com/en-us/azure/iot-pnp/set-up-environment) to complete the following procedures :

1. Use Azure commands or Azure portal to create  a Resource Group、an Iot Hub and a Device Provisioning Service
1. To link the DPS instance to your IoT hub
1. To create your device by individual device enrollment in your DPS instance.
1. Make a note of the DPS information (DPS endpoint/Registration ID/ID Scope/Symmetric key).
1. Set the DPS information got from the former step in "\Azure-IoTHub-Delta-device\run.sh".

```sh
export IOTHUB_DEVICE_SECURITY_TYPE="DPS"
export IOTHUB_DEVICE_DPS_ENDPOINT=""
export IOTHUB_DEVICE_DPS_ID_SCOPE=""
export IOTHUB_DEVICE_DPS_DEVICE_ID=""
export IOTHUB_DEVICE_DPS_DEVICE_KEY=""
```
**Run the sample**

Under the "Azure-IoTHub-Delta-device" folder,  execute run.sh.
>chmod +x run.sh

>source run.sh
<a name="ConnecttoCentral"></a>
# Connect to Azure IoT Central

**1. Create an application**

Please refer to [this tutorial](https://docs.microsoft.com/en-us/azure/iot-central/core/quick-deploy-iot-central) to create a "Custom application" template.

**2. Create a device template from the device catalog**

Please refer to [this tutorial](https://docs.microsoft.com/en-us/azure/iot-central/core/howto-set-up-template#create-a-device-template-from-the-device-catalog) to create the SGDC-D45-SC01 device template.

**3. Add a device**

Add a new device under SGDC-D45-SC01 device template.
Make a note of the device ID.

**4. Get connection information**

-    ID scope : In your IoT Central application, navigate to Administration > Device Connection. Make a note of the ID scope value.
-    Group primary key : In your IoT Central application, navigate to Administration > Device Connection > SAS-IoT-Devices. Make a note of the shared access signature Primary key value.

![](https://openvinofacestorage.blob.core.windows.net/iot-pnp-pictures/idscope.png)

![](https://openvinofacestorage.blob.core.windows.net/iot-pnp-pictures/primarykey.png)

Use the Cloud Shell to generate a device specific key from the group SAS key you just retrieved using the Azure CLI.

>az extension add --name azure-iot  
>az iot central device compute-device-key --device-id <the device id> --pk <the group SAS primary key value>

Make a note of the generated device key, and the ID scope for this application and set it to "\Azure-IoTHub-Delta-device\run.sh".

<a name="AdditionalLinks"></a>
# Additional Links

Please refer to the below link for additional information for Plug and Play 

-   [Manage cloud device messaging with Azure-IoT-Explorer](https://github.com/Azure/azure-iot-explorer/releases)
-   [Import the Plug and Play model](https://docs.microsoft.com/en-us/azure/iot-pnp/concepts-model-repository)
-   [Configure to connect to IoT Hub](https://docs.microsoft.com/en-us/azure/iot-pnp/quickstart-connect-device-c)
-   [How to use IoT Explorer to interact with the device ](https://docs.microsoft.com/en-us/azure/iot-pnp/howto-use-iot-explorer#install-azure-iot-explorer)   
