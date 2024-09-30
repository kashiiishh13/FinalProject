Clear-Host
$benchmark = @() #benchmark status
$cv = @() #Current Values

#Firewall status for the private profile
if((Get-NetFirewallProfile -Name Private).Enabled)
    {
         $benchmark += "Private: Firewall state is set to On"
         $cv += "On"
    }
else{ 
    $benchmark +=  "1) Windows Firewall: Private: Firewall state' is set to Off"
    $cv += "Off"
}

#Firewall status for the inbound connections
if((Get-NetFirewallProfile -Name Private).DefaultInboundAction -eq "Block"){
    $benchmark += "Inbound connections to Private profile are set to 'Block'"
    $cv += "Block"
}
else {
    $fire = (Get-NetFirewallProfile -Name Private).DefaultInboundAction
    $benchmark += "Inbound connections to Private profile are $fire "
    $cv += $fire.ToString()
}

#Firewall status for the outbound connections
if((Get-NetFirewallProfile -Name Private).DefaultOutboundAction -eq "Allow"){
    $benchmark += "Outbound connections are set to 'Allow'"
    $cv += "Allow"
}
else{
    $fire = ((Get-NetFirewallProfile -Name Private).DefaultOutboundAction)
    $benchmark += "Outbound connections are $fire"
    $cv += $fire.ToString()
}

#Notify on listen
if((Get-NetFirewallProfile -Name Private).NotifyOnListen -eq "False"){
    $benchmark += "Display a notification' is set to No"
    $cv += "No"
}
else{
    $fire = (Get-NetFirewallProfile -Name Private).NotifyOnListen
    $benchmark += "Display a notification' is set to $fire"
    $cv += $fire.ToString()
}

#log file name
if((Get-NetFirewallProfile -Name Private).LogFileName -eq "%systemroot%\system32\LogFiles\Firewall\pfirewall.log"){
    $benchmark += "Logging: Name' is set to '%SystemRoot%\System32\logfiles\firewall\Privatefw.log'"
    $cv += "%systemroot%\system32\LogFiles\Firewall\pfirewall.log"
    }
else{
    $benchmark += "Warning! Log file name is $(Get-NetFirewallProfile -Name Private).LogFileName."
    $cv += (Get-NetFirewallProfile -Name Private).LogFileName
}

#max size of the log file
if((Get-NetFirewallProfile -Name Private).LogMaxSizeKilobytes -ge 16384){
    $benchmark += "Logging: Size limit (KB)' is set to '16,384 KB or greater' "
    $cv += "16,384 or greater"
}
else{
    $fire = (Get-NetFirewallProfile -Name Private).LogMaxSizeKilobytes
    $benchmark += "Logging size is set to $fire"
    $cv += $fire.ToString()
}

#log the dropped packets
if((Get-NetFirewallProfile -Name Private).LogBlocked){
    $benchmark += "Logging: Log dropped packets' is set to 'Yes' "
    $cv += "Yes"
}
else{
    $benchmark += "Logging: Log dropped packets is set to No"
    $cv += "No"
}

#log the allowed packets
if((Get-NetFirewallProfile -Name Private).LogBlocked){
    $benchmark += "Logging: Log dropped packets' is set to 'Yes' "
    $cv += "Yes"
}
else{
    $benchmark += "Logging: Log dropped packets is set to No"
    $cv += "No"
}
$jsonBenchmark = $benchmark | ConvertTo-Json
$jsonBenchmark | Out-File "project\JSON\fwprivate_benchmark.json" -Encoding utf8
$jsonCurrentValue = $cv | ConvertTo-Json
$jsonCurrentValue | Out-File "project\JSON\fwprivate_CurrentValue.json" -Encoding utf8