targetScope = 'resourceGroup'

@description('Name of the managed identity')
param managedIdnetityName string

@description('Location for the managed identity')
param location string

@description('Tags for the managed identity')
param tags object

@description('Role definition id for the role assignment')
param roleId string

@description('Subscription id')
param subscriptionId string

resource managedIdnetity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managedIdnetityName
  location: location
  tags: tags
}

resource sub 'Microsoft.Subscription/aliases@2021-10-01' existing = {
  scope: tenant()
  name: subscriptionId
}


resource RoleDefinitionId 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: subscription()
  name: roleId
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscriptionId, managedIdnetityName)
  scope: sub
  properties: {
    principalType: 'ServicePrincipal'
    principalId: managedIdnetity.properties.principalId
    roleDefinitionId: RoleDefinitionId.id
  }
}

output subscriptionIdentity string = sub.properties.subscriptionId
