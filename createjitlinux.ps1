# deploy a new jitlinux machine in azure

 
# temp password that will be changed afer onboarding

  $username = "breakglass"
  $password = ConvertTo-SecureString "P@ssW0rD!SECRET" -AsPlainText -Force
  $Cred = New-Object System.Management.Automation.PSCredential($username, $password)
   

New-AzVm `
    -ResourceGroupName "CYBRDEMO" `
    -Name "jitlinux1" `
    -Location "westeurope" `
    -VirtualNetworkName "JITmyVnet" `
    -Image "jitlinux-image-demo" `
    -SubnetName "JITmySubnet" `
    -SecurityGroupName "JITmyNetworkSecurityGroup" `
    -PublicIpAddressName "JITmyPublicIpAddress" `
    -OpenPorts 22 `
    -Credential $Cred 

"$(Get-Date) azure resource created succesfully"
