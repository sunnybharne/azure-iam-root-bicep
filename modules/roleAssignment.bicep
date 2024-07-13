targetScope = 'tenant'

param principalId string
param roleDefinitionId string
param managementGroupId string
param subscriptionId string

resource roleDefinition 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: subscription(subscriptionId)
  name: roleDefinitionId
}

resource managementGroupReference 'Microsoft.Management/managementGroups@2023-04-01' existing = {
  name: managementGroupId
}

resource roleAssignement 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(principalId, roleDefinitionId)
  scope: managementGroupReference
  properties: {
    principalId: principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: roleDefinition.id
  }
}
