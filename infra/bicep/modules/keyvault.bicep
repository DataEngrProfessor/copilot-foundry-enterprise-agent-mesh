param location string
param env string
resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = { name: 'kv-legal-${env}', location: location, properties: { sku: { name: 'standard', family: 'A' }, tenantId: subscription().tenantId, accessPolicies: [] } }
