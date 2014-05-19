Add-Type -Path "c:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.DataManagement.Client.Framework.Vault.Forms.dll"
	$global:g_login=[Autodesk.DataManagement.Client.Framework.Vault.Forms.Library]::Login($null)

$xml = New-Object xml
$xml.Load('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml')
$date=$xml.Envelope.Cube.Cube.time
$rates = $xml.Envelope.Cube.Cube.Cube
$usd = $rates | Where-Object { $_.currency -eq 'USD' } | 
Select-Object -ExpandProperty rate
$ce=$g_login.WebServiceManager.CustomEntityService.GetAllCustomEntityDefinitions() | Where-Object{$_.DispName -eq "Exchange rate"}
$addRate=$g_login.WebServiceManager.CustomEntityService.AddCustomEntity($ce.Id, $date)
$ceDescr = $g_login.WebServiceManager.PropertyService.GetPropertyDefinitionInfosByEntityClassId("CUSTENT",$null) | Where-Object{$_.PropDef.SysName -eq "Description"}
$g_login.WebServiceManager.CustomEntityService.UpdateCustomEntityProperties($addRate.Id,$ceDescr.PropDef.Id,$usd)