Add-Type -Path "C:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.Connectivity.WebServices.dll"
$cred = New-Object Autodesk.Connectivity.WebServicesTools.UserPasswordCredentials ("localhost","Vault","Administrator","",$true)
$webSvc = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager ($cred)

$groups = $webSvc.AdminService.GetAllGroups()
$groups | Out-GridView