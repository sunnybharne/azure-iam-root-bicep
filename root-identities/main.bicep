param identityResourceGroupName string

//param managementGroupIdentityName string

param location string

param tags object

//resourceGroup
module rootIdentities '../modules/resourceGroup.bicep' = {
  name: identityResourceGroupName
  scope: subscription()
  params: {
    resourceGroupName: identityResourceGroupName
    resourceGroupLocation: location
    tags: tags
  }
}

//module managementGroupIdentity '../modules/managedIdentity.bicep' = {
//  name: managementGroupIdentityName
//  scope: resourceGroup()
//  params: {
//    managedIdnetityName: managementGroupIdentityName
//    location: location
//    tags: tags
//  }
//}
