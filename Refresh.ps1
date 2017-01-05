#Mimoune Djouallah https://datamonkeysite.com/

# get the server name and the port name of PowerBI desktop SSAS , thanks for Imke http://www.thebiccountant.com/2016/04/09/hackpowerbi/#more-1147

$pathtofile = (Get-ChildItem -Path c:\users -Filter msmdsrv.port.txt -Recurse -ErrorAction SilentlyContinue -Force).FullName
$port = gc $pathtofile
$port = $port -replace '\D',''
$dataSource = "localhost:$port"
$pathtoDataBase_Name = $pathtofile -replace 'msmdsrv.port.txt',''
$Database_Name = Get-ChildItem -Path $pathtoDataBase_Name -Filter *.db.xml -Recurse -ErrorAction SilentlyContinue -Force
$Database_Name = $Database_Name.ToString().Split(".") | select -First 1

#  Connect using AMO thanks for stackexchange :)


[System.Reflection.Assembly]::LoadFile("C:\Program Files (x86)\Microsoft SQL Server\130\SDK\Assemblies\Microsoft.AnalysisServices.tabular.DLL")
 ("Microsoft.AnalysisServices") >$NULL
$server = New-Object Microsoft.AnalysisServices.tabular.Server

$server.connect($dataSource)
$database = $server.Databases.Item($Database_Name)

# show some information 

if ($server.name -eq $null) {
 Write-Output ("Server '{0}' not found" -f $ServerName)
 break
}
else
{
$database = $server.Databases.Item($databasename)
if ($database.name -eq $null -or $database.name -eq "")
{
 Write-host "Database " $databasename " not found on the server $Servername"
 break
}
else
{
write-host "Server Name = " $Server.name
write-host "Database Name = " $database.Name
write-host "Database Last Schema Update = " $database.LastSchemaUpdate
write-host "Database Last Schema processed = " $database.LastProcessed
}
}

# thanks for Marco russo http://www.sqlbi.com/articles/using-process-add-in-tabular-models/

$model = $database.Model
$model.RequestRefresh("Full")
$model.SaveChanges()
