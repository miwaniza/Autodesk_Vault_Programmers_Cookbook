#$groups = $g_login.WebServiceManager.AdminService.GetAllgroups()
#$groups
$groups={
	$groupsList = @{}
Add-Type -Path "c:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.DataManagement.Client.Framework.Vault.Forms.dll"
$g_login=[Autodesk.DataManagement.Client.Framework.Vault.Forms.Library]::Login($null)
	foreach ($group in $g_login.WebServiceManager.AdminService.GetAllGroups()){
		$groups[$group.Name] = $group.Name
		}
		
	foreach ($groupName in $groups.Keys | Sort-Object) {
		$group = $groups[$groupName]
		switch -wildcard ($group.GetType()) {
			'*ProviderInfo' {
				Add-AdminConsoleProviderNode $groups[$groupName]
				break
			}
			'*DriveInfo' {
				Add-AdminConsoleDriveNode $groups[$groupName]
				break
			}
		}
	}
}
&$groups