#
# Read parameters from command line and environment.
#
$subId = $subscriptionId
$tenId = $TenantId
$appSrvPlanName = "asp-ps-graph-az-demo"
$webAppName = "webapp-ps-graph-az-demo"
$location = "East US"
$resGroupName = "rg-ps-graph-az-demo"

# Set the Azure context
Set-AzContext -Subscription $subId -Tenant $tenId -Force

# Create a resource group.
$resGroup = Get-AzResourceGroup -Name $resGroupName -ErrorAction SilentlyContinue
if ($null -ne $resGroup) {
    Write-Host "Update existing resource group - $resGroupName"
} Else {
    Write-Host "Create resource group - $resGroupName"
    New-AzResourceGroup -Name $resGroupName -Location $location
}


# Create an App Service plan in Free tier.
$appSrvPlan = Get-AzAppServicePlan -ResourceGroupName $resGroupName -Name $appSrvPlanName -ErrorAction SilentlyContinue
if ($null -ne $appSrvPlan) {
    Write-Host "Update existing App Service Plan - $appSrvPlanName"
} Else {
    Write-Host "Create App Service Plan - $appSrvPlanName"
    New-AzAppServicePlan -name $appSrvPlanName -Location $location -ResourceGroupName $resGroupName -Tier Free
}


# Create a web app.
$webApp = Get-AzWebApp -ResourceGroupName $resGroupName -Name $webAppName -ErrorAction SilentlyContinue
if ($null -ne $webApp) {
    Write-Host "Update existing App Service - $webAppName"
} Else {
    Write-Host "Create App Service - $webAppName"
    New-AzWebApp -Name $webAppName -Location $location -AppServicePlan $appSrvPlanName -ResourceGroupName $resGroupName
}
