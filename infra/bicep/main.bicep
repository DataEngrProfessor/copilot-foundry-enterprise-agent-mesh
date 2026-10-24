
param location string = resourceGroup().location
param env string = 'dev'

module search './modules/search.bicep' = { name: 'search', params: { location: location, env: env } }
module openai './modules/openai.bicep' = { name: 'openai', params: { location: location, env: env } }
module apim './modules/apim.bicep' = { name: 'apim', params: { location: location, env: env } }
module kv './modules/keyvault.bicep' = { name: 'kv', params: { location: location, env: env } }
module monitor './modules/monitor.bicep' = { name: 'monitor', params: { location: location, env: env } }

output foundryEndpoint string = openai.outputs.endpoint
