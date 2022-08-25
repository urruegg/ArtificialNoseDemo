@description('Define the project name or prefix for all objects.')
@minLength(1)
@maxLength(11)
param baseName string = 'zurusean'

@description('The datacenter to use for the deployment.')
param location string = resourceGroup().location

@description('The SKU to use for the IoT Hub.')
param skuName string = 'ST0'

var iotCentralAppName = '${baseName}Hub${uniqueString(resourceGroup().id)}'

resource IoTCentral 'Microsoft.IoTCentral/iotApps@2021-11-01-preview' = {
  name: iotCentralAppName
  location: location
  sku: {
    name: skuName
  }
  properties: {
    displayName: 'ArtficialNoseApp'
    networkRuleSets: {
      applyToDevices: true
      applyToIoTCentral: true
      defaultAction: 'Deny'
      ipRules:[
        {
          filterName: 'string'
          ipMask: 'string'
        }
      ]
    }
    publicNetworkAccess: 'string'
    subdomain: 'string'
    template: 'string'
  }
}
