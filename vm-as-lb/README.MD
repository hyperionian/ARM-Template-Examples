# Create an Azure virtual machines in an Avaialbility Set running Windows Server Data Center Core or Red Hat Linux with Internal Load Balancer within an existing Resource Group and VNet

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhyperionian%2FARM-Templates%2Fmaster%2Fvm-as-lb%2Fazuredeploy.json" target="_blank">
  <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fhyperionian%2FARM-Templates%2Fmaster%F2vm-as-lb%2Fazuredeploy.json" target="_blank">
  <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Solution overview

This template provisions multiple instances of virtual machines with **Windows Server 2016 Core or Red Hat Linux** within an Avaialbility Set using customer managed disk as OS disk. It also creates an Internal Load Balancer to load balance the network traffic 


This template  depends on the following resources to be created before deployment

+	An existing Azure Resource Group
+	An existing Azure Virtual Network and Subnet

This template also  creates the following resources

+	A storage account for OS disk and Boot diagnostics
+	Internal Load Balancer
+   Azure Virtual Machines
+   Availability Set
+   Network Interfaces

`Tags: Availability Set, Azure Virtual Machine, Load Balancer `