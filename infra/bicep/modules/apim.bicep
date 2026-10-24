
param location string
param env string
resource apim 'Microsoft.ApiManagement/service@2023-05-01-preview' = {
  name: 'apim-ai-${env}'
  location: location
  sku: { name: 'Developer', capacity: 1 }
  properties: { publisherEmail: 'admin@contoso.com', publisherName: 'Contoso' }
}
// Policies: rate-limit by group, pii redaction, model routing gpt-4o-mini for classification
