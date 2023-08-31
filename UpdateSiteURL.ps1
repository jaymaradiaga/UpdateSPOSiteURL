# Prompt for Admin Center URL
$AdminCenterURL = Read-Host "Enter the Admin Center URL (e.g., https://cloudweir-admin.sharepoint.com)"

# Prompt for Site URL
$SiteURL = Read-Host "Enter the current Site URL (e.g., https://yourtenant.sharepoint.com/sites/yoursite)"

# Prompt for New Site URL
$NewSiteURL = Read-Host "Enter the new Site URL (e.g., https://yourtenant.sharepoint.com/sites/yoursite)"

# Prompt for New Site Title (optional)
$NewSiteTitle = Read-Host "Enter the new Site Title (press Enter if not changing the title)"

# Connect to SharePoint Online
Connect-SPOService -Url $AdminCenterURL

# Get all site collections
$Sites = Get-SPOSite -Limit All | Select-Object -ExpandProperty URL

if ($Sites -notcontains $NewSiteURL) {
    # Rename SharePoint Online site URL using PowerShell
    Start-SPOSiteRename -Identity $SiteURL -NewSiteUrl $NewSiteURL -NewSiteTitle $NewSiteTitle -Confirm:$false
}
else {
    Write-Host "New Site URL '$NewSiteURL' is not available!" -ForegroundColor Yellow
}
