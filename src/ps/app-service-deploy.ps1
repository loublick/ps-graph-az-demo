# Replace the following URL with a public GitHub repo URL
#$gitrepo="https://github.com/Azure-Samples/app-service-web-dotnet-get-started.git"
$subscriptionId=$SubscriptionId
$tenantId=$TenantId
$webappname="mywebapp$(Get-Random)"
$location="East US"
$resourceGroupName="rg-ps-graph-az-demo"

# Set the Azure context
Set-AzContext -Subscription "38f49f24-d0b7-461a-9801-85c65fc65628" -Force
Set-AzContext -Tenant "8df4579d-a09d-4eae-828e-42f483ca5f70" -Force

# Create a resource group.
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create an App Service plan in Free tier.
New-AzAppServicePlan -Name $webappname -Location $location -ResourceGroupName $resourceGroupName -Tier Free

# Create a web app.
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName $resourceGroupName
