using './main.bicep'

//param managementGroupIdentityName = 'id-ManagementGroup-sc-prod-01'

param location = 'swedencentral'

param identityResourceGroupName = 'rg-mg-sc-prod-01'

param tags = {
  environment: 'production'
}
