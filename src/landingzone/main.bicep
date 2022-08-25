param location string = resourceGroup().location
param baseName string


module iotcentral 'modules/iotcentral/iotcentral.bicep' = {
  name: 'iotcentral-${baseName}'
  params: {
    baseName: baseName
    location: location
    skuName: 'ST0'
  }
}
