if ($g_login -eq $null)
	{Add-Type -Path "c:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.DataManagement.Client.Framework.Vault.Forms.dll"
	$global:g_login=[Autodesk.DataManagement.Client.Framework.Vault.Forms.Library]::Login($null)
	[Autodesk.DataManagement.Client.Framework.Vault.Currency.Entities.Folder]
	
	}

$list = New-Object 'System.Collections.Generic.List[object]'

try {
$global:root = $g_login.FolderManager.RootFolder
$list.Add($root)
}
catch {
"error"
}

 $folders = $g_login.FolderManager.GetChildFolders($root, $false, $false)
			foreach ( $folder in $folders)
				{
 					$more=$g_login.FolderManager.GetChildFolders($folder, $false, $false)
					
					foreach ( $fold in $more)
				{
 					$fold.EntityName
				}  
				}  
  #$folders
