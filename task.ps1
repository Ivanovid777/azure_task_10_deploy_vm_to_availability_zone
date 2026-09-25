$location = "denmarkeast"
$resourceGroupName = "mate-resources"
$networkSecurityGroupName = "defaultnsg"
$virtualNetworkName = "vnet"
$subnetName = "default"
$vnetAddressPrefix = "10.0.0.0/16"
$subnetAddressPrefix = "10.0.0.0/24"
$sshKeyName = "linuxboxsshkey"
$sshKeyPublicKey = Get-Content "~/.ssh/id_rsa.pub"
$vmName = "matebox"
$vmImage = "Ubuntu2204"
$vmSize = "Standard_B1s"

New-AzResourceGroup -Name $resourceGroupName -Location $location -Force

New-AzVm `
-ResourceGroupName $resourceGroupName `
-Name "${vmName}1" `
-Zone "1" `
-Location $location `
-Image $vmImage `
-Size $vmSize `
-SubnetName $subnetName `
-VirtualNetworkName $virtualNetworkName `
-SecurityGroupName $networkSecurityGroupName `
-SshKeyName $sshKeyName

New-AzVm `
-ResourceGroupName $resourceGroupName `
-Name "${vmName}2" `
-Zone "2" `
-Location $location `
-Image $vmImage `
-Size $vmSize `
-SubnetName $subnetName `
-VirtualNetworkName $virtualNetworkName `
-SecurityGroupName $networkSecurityGroupName `
-SshKeyName $sshKeyName