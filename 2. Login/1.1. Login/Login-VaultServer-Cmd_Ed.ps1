param ($help,$VServer,$VVault,$VUser,$VPass,$VOut)

$WebServicesPath2014="..\..\bin\Autodesk.Connectivity.WebServices.dll"


if ($help)
{
"Login Vault with read-only connection`n"
"Usage:"
"  Login-VaultServer.ps1 -Vserver <server address> -VVault <vault name> -VUser <username> [-VPass <password>]`n"
"Arguments:"
"  -Vserver		Autodesk Vault server name. In any format: IP, DNS, IP:port, DNS:port."
"  -VVault		Vault name."
"  -VUser		Registered user name."
"  -VPass		Password."
"`nExample:"
"  powershell .\Export-FileCategories.ps1 -Vserver localhost -VVault Vault -VUser Administrator -VPass pass`n"
exit
}
else{
	if (!$VServer -or !$VVault -or !$VUser){"Invalid arguments. Use 'help' argument for more help"
	exit}
}

try
	{
	"Trying to find Vault 2014 dll"
	Add-Type -Path $WebServicesPath2014 #Vault 2014
	}
Catch
	{
	"No dlls were found. Edit script or contact author."
	exit
	}	

"Found - executing"
try{
$cred = New-Object Autodesk.Connectivity.WebServicesTools.UserPasswordCredentials ($VServer,$VVault,$VUser,$VPass,$true)
$webSvc = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager ($cred)
Write-Output $webSvc
}
Catch
{"Login failed"
exit}