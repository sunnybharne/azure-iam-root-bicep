using './main.bicep'

param managementGroupIdentityName = 'id-mg-sc-prod-01'

param location = 'swedencentral'

param identityResourceGroupName = 'rg-identities-sc-prod-01'

param tags = {
  environment: 'production'
}
