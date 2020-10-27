Create Virtual Machine with Data Disks and Endpoints
====================================================

            
This example shows how to script the provisioning of a single Windows Azure Virtual Machine that has two additional data disks and two network endpoints opened up on boot. This script could easily be modified to add multiple virtual machines
 as part of a more complex deployment.

Cmdlets used:
New-AzureVMConfig
New-AzureVM
Set-AzureSubscription
Select-AzureSubscription
Add-AzureDataDisk
Add-AzureEndpoint
 

 


        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
