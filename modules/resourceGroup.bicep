targetScope='subscription'

@description('Name of the resource group to create')
param resourceGroupName string

@description('Location of the resource group to create')
param resourceGroupLocation string

@description('Tags for the resource group')
param tags object

resource Rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: tags
}

output name string = Rg.name
output id string = Rg.id
