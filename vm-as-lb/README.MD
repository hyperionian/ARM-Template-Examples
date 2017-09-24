# Create multiple Azure Virtual Machines in an Avaialbility Set running Windows Server Data Center Core with DSC extension or Red Hat Linux with Internal Load Balancer 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhyperionian%2FARM-Templates%2Fmaster%2Fvm-as-lb%2Fazuredeploy.json" target="_blank">
  <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperionian%2FARM-Templates%2Fmaster%F2vm-as-lb%2Fazuredeploy.json" target="_blank">
  <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Solution overview

This template provisions multiple instances of virtual machines with **Windows Server 2016 Core or Red Hat Linux** within an Avaialbility Set using customer managed disk in existing Azure Resource Group, Azure Virtual Network, and subnet. It also creates an Internal Load Balancer to load balance the network traffic to Virtual Machines

This template  depends on the following resources to be created before deployment

+	An existing Azure Resource Group
+	Existing Azure Virtual Network and Subnet

This template also  creates the following resources

-	A storage account for OS disk and Boot diagnostics
-	Internal Load Balancer
- Azure Virtual Machines
- Availability Set
- Network Interfaces
- Power Shell DSC (Desired State Configuration) extension to enact DSC configurations (Add a Windows firewall rule in this template) on all VMs

`Availability Set, Azure Virtual Machine, Load Balancer, Azure VM extensions, Power Shell DSC extension`