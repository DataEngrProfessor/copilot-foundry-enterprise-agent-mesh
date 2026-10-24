param location string
param env string
resource aoai 'Microsoft.CognitiveServices/accounts@2023-10-01-preview' = { name: 'foundry-${env}', location: location, kind: 'OpenAI', sku: { name: 'S0' } }
output endpoint string = aoai.properties.endpoint
