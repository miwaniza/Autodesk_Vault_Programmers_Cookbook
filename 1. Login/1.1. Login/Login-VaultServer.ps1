#Подключение динамической библиотеки для обращения к серверу
#Реализация, актуальная для 2012 версии
#Add-Type -Path "C:\Program Files (x86)\Autodesk\Autodesk Vault 2012 SDK\bin\Autodesk.Connectivity.WebServicesTools.dll"
#Реализация, актуальная для 2014 версии: WebServicesTools.dll влили в WebServices.dll, однако пространство имен осталось прежним.
Add-Type -Path "C:\Program Files (x86)\Autodesk\Autodesk Vault 2014 SDK\bin\Autodesk.Connectivity.WebServices.dll"
#Получение полномочий в режиме «только чтение».
$cred = New-Object Autodesk.Connectivity.WebServicesTools.UserPasswordCredentials ("localhost", "Vault", "Administrator", "", $true)
#Создание менеджера
$webSvc = New-Object Autodesk.Connectivity.WebServicesTools.WebServiceManager ($cred)
#Получение списка всех пользователей через AdminService
$users = $webSvc.AdminService.GetAllUsers()
#Экспорт списка в CSV: строим конвейер при помощи символа «|»
#Для корректной работы с символами кириллицы, включаем поддержку юникода: «-Encoding Unicode»
$users | Export-Csv c:/AllUsers.csv -Delimiter ";" -Encoding Unicode
# Для вывода только активных пользователей используем фильтрацию по свойству IsActive, посредством команды Where-Object.
#К свойствам объектов $users в пределах { …} обращаемся посредством конструкции «$_.»
#Выводим в отдельный файл командой Export-Csv
$users | Where-Object { $_.IsActive -eq "True" } | Export-Csv c:/ActiveUsers.csv -Delimiter ";" -Encoding unicode