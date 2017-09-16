# Create an Azure virtual machines in an Avaialbility Set running Windows Server Data Center Core or Red Hat Linux with Internal Load Balancer within an existing Resource Group and VNet

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3%2%2raw.githubusercontent.com%2hyperionian%2ARM-Templates%2master%2vm-as-lb%2azuredeploy.json" target="_blank">
  <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3%2%2raw.githubusercontent.com%2hyperionian%2ARM-Templates%2master%2vm-as-lb%2azuredeploy.json" target="_blank">
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