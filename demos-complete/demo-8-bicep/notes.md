"compiles" to ARM template
supports modules
supports dependency inference.

you still need to deploy a resource group 

    az group create --name "bicep-demo" --location uksouth

create empty bicep file

    bicep build .\main.bicep

add the storage account, build again an show output

    resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
        name: 'mfbicepdemo01' // must be globally unique
        location: 'uksouth'
        kind: 'Storage'
        sku: {
            name: 'Standard_GRS'
        }
    }

At each step make change, build and show output

create parameter for storage account name (with default value)

    param storage_account_name string = 'mfbicepdemo01'

create variable for location (based on resourceGroup)

    var location = resourceGroup().location

Add dependent blob container, note string interpolation using the stg output

    resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
        name: '${stg.name}/default/mycontainer'
    }

Show dependsOn added to output.

