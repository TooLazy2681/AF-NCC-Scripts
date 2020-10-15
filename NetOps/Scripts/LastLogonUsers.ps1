﻿$OutFile = "Users.csv"
$FilePath = "C:\Transfer\PSScripts"

Get-ADUser -Filter * -SearchBase "OU=McConnell AFB Users, OU=McConnell AFB, OU=AFCONUSWEST, OU=Bases, DC=AREA52, DC=AFNOAPPS, DC=USAF, DC=MIL" `
    -ResultPageSize 0 -Properties CN, samaccountname, lastLogonTimeStamp | ` 
    Select CN, samaccountname, @{n="lastLogonDate";e={[datetime]::FromFileTime($_.lastLogonTimestamp)}} | `
    Export-CSV -NoType $FilePath\$OutFile