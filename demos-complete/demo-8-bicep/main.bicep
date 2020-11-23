var location = resourceGroup().location
param storage_account_name string = 'mfbicepdemo01'

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storage_account_name // must be globally unique
  location: location
  kind: 'Storage'
  sku: {
      name: 'Standard_GRS'
  }
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${stg.name}/default/mycontainer'
}