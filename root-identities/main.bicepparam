using './main.bicep'

param managementGroupIdentityName = 'id-mg-sc-prod-01'

param location = 'swedencentral'

param identityResourceGroupName = 'rg-identities-sc-prod-01'

param tenent_root_subscriptionId = '1fe7300e-02ba-47d4-a41d-d94acb1b5465'

param mg_contributor_roleId = '5d58bcaf-24a5-4b20-bdb6-eed9f69fbe4c'

param tags = {
  environment: 'production'
}
