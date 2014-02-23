#Connecting dll
Add-Type -Path "..\..\bin\Autodesk.Connectivity.WebServices.dll"
#Retreiving read-only credentials
$cred = New-Object Autodesk.Connectivity.WebServicesTools.UserPasswordCredentials ("localhost", "Vault", "Administrator", "", $true)
#Creating manager
$webSvc = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager ($cred)
#Drop connection
$webSvc.Dispose()