powershell -Command "Invoke-WebRequest https://amazon-ssm-us-east-1.s3.us-east-1.amazonaws.com/latest/windows_amd64/AmazonSSMAgentSetup.exe -OutFile $env:USERPROFILE\Desktop\SSMAgent_latest.exe"
powershell -Command "Start-Process -FilePath $env:USERPROFILE\Desktop\SSMAgent_latest.exe -ArgumentList '/S'"
powershell -Command "rm -Force $env:USERPROFILE\Desktop\SSMAgent_latest.exe"
