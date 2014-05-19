#Connecting dll
Add-Type -Path "..\..\bin\Autodesk.Connectivity.WebServices.dll"
#Retreiving read-only credentials
$cred = New-Object Autodesk.Connectivity.WebServicesTools.AnonymousCredentials("srv_pko1")
#Creating manager
$webSvc = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager($cred)
#$webSvc = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager ($cred)