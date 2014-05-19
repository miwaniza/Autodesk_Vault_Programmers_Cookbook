#Connect dll
Add-Type -Path "c:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.DataManagement.Client.Framework.Vault.Forms.dll"

#Call login dialog and workflow, get credentials on successfull login 
$g_login=[Autodesk.DataManagement.Client.Framework.Vault.Forms.Library]::Login($null)