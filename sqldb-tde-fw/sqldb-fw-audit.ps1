#Login to Azure Subscription as user with write permissions for Azure SQL resources
Login-AzureRmAccount

# Set the resource group name and location for your server
$resourcegroupname = "azsqldbt3-rg"
$vnetsharedresourcegroupname = "azsqldb-rg"
$location = "eastus"

#Vnet and subnet details
$vnetname = "app-vnet"
$subnetname = "Default"
$vnetRuleName = "vnet-sqlrule"


# Set an admin login and password for your server
#Prompt for credentials
$cred = Get-Credential

# The logical server name has to be unique in the system
$servername = "tdeserver03"
# The sample database name
$databasename = "MyData"

#AAD Group Display Name for Azure SQL AD Admin
$ADGroupDisplayName = "SQLADadmin"

# The ip address range that you want to allow to access your server
$startip = "51.1.1.1"
$endip = "51.1.1.1"

# The storage account name has to be unique in the system
$storageaccountname = "tdeserver01"
# Specify the email recipients for the threat detection alerts
$notificationemailreceipient = "run@robot.com"


# Create a new server with a system wide unique server name
$server = New-AzureRmSqlServer -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -Location $location `
    -SqlAdministratorCredentials $cred 
    -AssignIdentity ;

# Create a server firewall rule that allows access from the specified IP range
$serverfirewallrule = New-AzureRmSqlServerFirewallRule -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -FirewallRuleName "AllowedIPs" -StartIpAddress $startip -EndIpAddress $endip;

# Create a blank database with S0 performance level
$database = New-AzureRmSqlDatabase  -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -DatabaseName $databasename -RequestedServiceObjectiveName "S0";
    
#Set Azure AD Admin for Azure SQL DB
Write-Host "Set Azure AD Admin for Azure SQL DB";

Set-AzureRmSqlServerActiveDirectoryAdministrator –ResourceGroupName $resourcegroupname `
-ServerName $servername `
-DisplayName $ADGroupDisplayName ;

# Set an auditing policy
Write-Host "Set Server Level  Auditing";

Set-AzureRmSqlServerAuditing -State Enabled `
    -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -StorageAccountName $storageaccountname ;
    


# Set a threat detection policy
Set-AzureRmSqlServerThreatDetectionPolicy -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -StorageAccountName $storageaccountname `
    -NotificationRecipientsEmails $notificationemailreceipient `
    -EmailAdmins $False ;


Write-Host "Add the subnet id as a rule, into the ACLs for your Azure SQL Database server.";

#Add subnet into Virtual Network Rule
Write-Host "Get the subnet object.";

$vnet = Get-AzureRmVirtualNetwork `
-ResourceGroupName $vnetsharedResourceGroupName `
-Name              $VNetName;

$subnet = Get-AzureRmVirtualNetworkSubnetConfig `
-Name           $SubnetName `
-VirtualNetwork $vnet;

$vnetRuleObject1 = New-AzureRmSqlServerVirtualNetworkRule `
-ResourceGroupName      $ResourceGroupName `
-ServerName             $servername `
-VirtualNetworkRuleName $VNetRuleName `
-VirtualNetworkSubnetId $subnet.Id;

Write-Host "Azure SQL Database details including MSI Principal Id" ;

$server.Identity.PrincipalId;
$database;
$vnetRuleObject1;

