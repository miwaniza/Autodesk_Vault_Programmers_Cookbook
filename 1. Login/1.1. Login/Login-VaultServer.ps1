#����������� ������������ ���������� ��� ��������� � �������
#����������, ���������� ��� 2012 ������
#Add-Type -Path "C:\Program Files (x86)\Autodesk\Autodesk Vault 2012 SDK\bin\Autodesk.Connectivity.WebServicesTools.dll"
#����������, ���������� ��� 2014 ������: WebServicesTools.dll ����� � WebServices.dll, ������ ������������ ���� �������� �������.
Add-Type -Path "C:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.Connectivity.WebServices.dll"
#��������� ���������� � ������ ������� ������.
$cred = New-Object Autodesk.Connectivity.WebServicesTools.UserPasswordCredentials ("localhost", "Vault", "Administrator", "", $true)
#�������� ���������
$webSvc = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager ($cred)
#��������� ������ ���� ������������� ����� AdminService
$users = $webSvc.AdminService.GetAllUsers()
#������� ������ � CSV: ������ �������� ��� ������ ������� �|�
#��� ���������� ������ � ��������� ���������, �������� ��������� �������: �-Encoding Unicode�
$users | Export-Csv c:/AllUsers.csv -Delimiter ";" -Encoding Unicode
# ��� ������ ������ �������� ������������� ���������� ���������� �� �������� IsActive, ����������� ������� Where-Object.
#� ��������� �������� $users � �������� { �} ���������� ����������� ����������� �$_.�
#������� � ��������� ���� �������� Export-Csv
$users | Where-Object { $_.IsActive -eq "True" } | Export-Csv c:/ActiveUsers.csv -Delimiter ";" -Encoding unicode