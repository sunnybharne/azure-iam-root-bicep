targetScope = 'subscription'

param identityResourceGroupName string

param managementGroupIdentityName string

param location string

param tags object

param tenantRootMgId string

//resourceGroup
module identitiesResourceGroup '../modules/resourceGroup.bicep' = {
  name: identityResourceGroupName
  scope: subscription()
  params: {
    resourceGroupName: identityResourceGroupName
    resourceGroupLocation: location
    tags: tags
  }
}

module managementGroupIdentity '../modules/managedIdentity.bicep' = {
  name: managementGroupIdentityName
  scope: resourceGroup(identityResourceGroupName)
  params: {
    managedIdnetityName: managementGroupIdentityName
    location: location
    tags: tags
  }
  dependsOn: [
    identitiesResourceGroup
  ]
}

resource tenantRootMG 'Microsoft.Management/managementGroups@2023-04-01' existing = {
  scope: tenant()
  name: tenantRootMgId
}

module roleAssignment '../modules/roleAssignment.bicep' = {
  name: 'roleAssignment'
  scope: managementGroup(tenantRootMG.name)
  params: {
    principalId: managementGroupIdentity.outputs.principalId
    roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
  }
  dependsOn: [
    managementGroupIdentity
  ]
}
