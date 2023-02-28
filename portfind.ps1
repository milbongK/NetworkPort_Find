##make with powershell

$serverList = get-content "D:\portFind\dns_list.txt"
$portList = "80", "443"
$data = ""

For ($i=0; $i -lt $serverList.count; $i++){
    for ($j=0; $j -lt $portList.count; $j++){
        $data += Test-NetConnection -ComputerName $serverList[$i] -Port $portList[$j] | Select-Object computername, remoteaddress, remoteport, TcpTestSucceeded
        $data += "`n"
        }
    }


out-file -filePath "D:\portFind\serverport.txt" -inputobject $data
