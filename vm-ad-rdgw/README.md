# Create multiple Windows Azure Virtual Machines with one VM as AD domain controller and another VM in an availability set as Remote Desktop Gateway/Web joined to AD domain

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhyperionian%2FARM-Templates%2Fmaster%2Fvm-ad-rdgw%2Fazuredeploy.json" target="_blank">
  <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperionian%2FARM-Templates%2Fmaster%F2vm-ad-rdgw%2Fazuredeploy.json" target="_blank">
  <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Solution overview

This template provisions two instances of Windows virtual machines. One VM is as AD domain controller and another VM is in an Avaialbility Set as Remote Desktop Gateway/Web role which is also joined to AD domain in pre-existing Azure Resource Group, Azure Virtual Network, and subnet. It also creates an Internal Load Balancer to load balance the network traffic to Remote Desktop Web VM.

This template  depends on the following resources to be created before deployment

+	An existing Azure Resource Group
+	Existing Azure Virtual Network and Subnet

This template also  creates the following resources

- A storage account for OS disk and Boot diagnostics
- Internal Load Balancer
- An Azure Virtual Machine configured as AD domain controller through PowerShell DSC extension
- Availability Set
- A second Virtual Machine referred in linked template as Remote Desktop Gateway/Web role joined to AD domain setup in the master template


`Availability Set, Azure Virtual Machine, Load Balancer, Azure VM extensions, Power Shell DSC extension, Remote Desktop Gateway/Web`