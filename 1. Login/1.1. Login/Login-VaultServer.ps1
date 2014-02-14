#Connecting dll
Add-Type -Path "C:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.Connectivity.WebServices.dll"
#Retreiving read-only credentials
$cred = New-Object Autodesk.Connectivity.WebServicesTools.UserPasswordCredentials ("localhost", "Vault", "Administrator", "", $true)
#Creating manager
$webSvc = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager ($cred)