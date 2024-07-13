targetScope = 'resourceGroup'

@description('Name of the managed identity')
param managedIdnetityName string

@description('Location for the managed identity')
param location string

@description('Tags for the managed identity')
param tags object

resource managedIdnetity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managedIdnetityName
  location: location
  tags: tags
}
