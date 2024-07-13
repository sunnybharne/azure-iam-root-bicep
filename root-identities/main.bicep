targetScope = 'subscription'

param identityResourceGroupName string

param managementGroupIdentityName string

param location string

param tags object

param tenent_root_subscriptionId string

param mg_contributor_roleId string

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

module managementGroupIdentity '../modules/create-managedIdentity.bicep' = {
  name: managementGroupIdentityName
  scope: resourceGroup(identityResourceGroupName)
  params: {
    subscriptionId: tenent_root_subscriptionId
    roleId: mg_contributor_roleId
    managedIdnetityName: managementGroupIdentityName
    location: location
    tags: tags
  }
  dependsOn: [
    identitiesResourceGroup
  ]
}
