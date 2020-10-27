<#
  Creates a Virtual Machine with Disks and Endpoints Configured
  Use Get-AzurePublishSettingsFile and Import-AzurePublishSettings file to import your subscription settings
  See: http://michaelwasham.com/2012/07/13/connecting-windows-azure-virtual-machines-with-powershell/ for more examples
  
  
  Author: Michael Washam
  Website: http://michaelwasham.com
  Twitter: MWashamMS
#>

# Retrieve with Get-AzureSubscription 
$subscriptionName = '[MY SUBSCRIPTION]'  

# Retreive with Get-AzureStorageAccount 
$storageAccountName = '[MY STORAGE ACCOUNT]'   

# Specify the storage account location to store the newly created VHDs 
Set-AzureSubscription -SubscriptionName $subscriptionName -CurrentStorageAccount $storageAccountName 
 
# Select the correct subscription (allows multiple subscription support) 
Select-AzureSubscription -SubscriptionName $subscriptionName 

# Retreive with Get-AzureLocation 
$location = 'West US' 

# Retrieve Server 2012 image name with Get-AzureVMImage
$imageName = 'MSFT__Windows-Server-2012-Datacenter-201210.01-en.us-30GB.vhd'

# ExtraSmall, Small, Medium, Large, ExtraLarge
$instanceSize = 'Medium' 

# Has to be a unique name. Verify with Test-AzureService
$serviceName = '[UNIQUE SERVICE NAME]' 

# Server Name
$vmname1 = '[MY VM NAME]'
$admpwd = '[MY PASSWORD]' 


$vm1 = New-AzureVMConfig -Name $vmname1 -InstanceSize $instanceSize -ImageName $imageName |
	Add-AzureProvisioningConfig -Windows -Password $admpwd | 
	Add-AzureDataDisk -CreateNew -DiskLabel 'mydatadisk1' -DiskSizeInGB 100 -LUN 0 |
	Add-AzureDataDisk -CreateNew -DiskLabel 'mydatadisk2' -DiskSizeInGB 100 -LUN 1 |
	Add-AzureEndpoint -Name 'http' -LocalPort 80 -PublicPort 80 -Protocol tcp |
	Add-AzureEndpoint -Name 'https' -LocalPort 443 -PublicPort 443 -Protocol tcp 
	

New-AzureVM -ServiceName $serviceName -Location $location -VMs $vm1