Add-Type -Path "c:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.DataManagement.Client.Framework.Vault.Forms.dll"

$g_login=[Autodesk.DataManagement.Client.Framework.Vault.Forms.Library]::Login($null)
$categories = $g_login.CategoryManager.GetAvailableCategories()| Where-Object {$_.AssociatedEntityClass -like 'Файл'} | Format-List
$categories