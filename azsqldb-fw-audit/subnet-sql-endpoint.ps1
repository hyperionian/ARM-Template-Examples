$vnetName = "app-vnet"
$vnetsharedResourceGroupName = "azsqldb-rg"
$subnetname = "default"
$SubnetAddressPrefix = "10.20.1.0/24"

#Create subnet endpoint for MS SQL for a VNet in $VNetName
$vnet = Get-AzureRmVirtualNetwork `
-Name              $VNetName `
-ResourceGroupName $vnetsharedResourceGroupName ;


Write-Host "Assign a Virtual Service endpoint 'Microsoft.Sql' to the subnet.";

$vnet = Set-AzureRmVirtualNetworkSubnetConfig `
-Name            $SubnetName `
-AddressPrefix   $SubnetAddressPrefix `
-VirtualNetwork  $vnet `
-ServiceEndpoint "Microsoft.Sql";

$vnet = Set-AzureRmVirtualNetwork `
-VirtualNetwork $vnet;

