// Azure AI Search with semantic ranker, ACL fields user_oids, client_id
resource search 'Microsoft.Search/searchServices@2023-11-01' = { name: 'srch-legal-${env}', location: location, sku: { name: 'standard' } }
