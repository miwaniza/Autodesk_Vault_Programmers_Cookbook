Add-Type -Path "c:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.DataManagement.Client.Framework.Vault.Forms.dll"

$g_login=[Autodesk.DataManagement.Client.Framework.Vault.Forms.Library]::Login($null)
$logoutMessage= New-Object Autodesk.DataManagement.Client.Framework.Vault.Forms.Settings.LogoutSettings
$logoutMessage.LogOutMessage="Successfull logout"
$g_login=[Autodesk.DataManagement.Client.Framework.Vault.Forms.Library]::Logout($g_login,$logoutMessage,$null)