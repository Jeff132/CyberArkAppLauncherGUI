<#

This can be used to launch an application from Cyberark PSM servers

#>

 

Add-Type -AssemblyName System.Windows.Forms

[System.Windows.Forms.Application]::EnableVisualStyles()

Add-Type -Name Window -Namespace Console -MemberDefinition '

[DllImport("Kernel32.dll")]

public static extern IntPtr GetConsoleWindow();

 

[DllImport("user32.dll")]

public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'

 

###############Form Design Parameters################

#####################################################

#Co-ordinates

$label_x = 30

$txt_x = 130

$line1_y = 50

$line_increment = 50

$i=1

 

#Label & Text box width

$form_width =400

$form_height = 400

$txt_width = 200

$txt_height = 10

$lbl_width = 25

$lbl_height = 10

 

#Font settings

$lbl_font_size = 10

$txt_font_size = 10

$font_type = "Microsoft Sans Serif"

 

############End of Form Design Parameters############

#####################################################

 

 

###################Form Definition###################

#####################################################

#Define Form

$Generate_PSM_RDP_File                  = New-Object system.Windows.Forms.Form

$Generate_PSM_RDP_File.ClientSize       = "$form_width,$form_height"

$Generate_PSM_RDP_File.text             = "CyberArk Application Launcher"

$Generate_PSM_RDP_File.TopMost          = $false

$Generate_PSM_RDP_File.StartPosition    = "CenterScreen"

$Generate_PSM_RDP_File.MaximizeBox      = $false

 

#Form Icon

$iconBase64      = "AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAABILAAASCwAAAAAAAAAAAAD///8A////AP///wD///8A////AP///wC3fT1Qt3094KxdAOCsXQBQ////AP///wD///8A////AP///wD///8A////AP///wD///8A////ALd9PTC3fT3At309/7d9Pf+sXQD/rF0A/6xdAMCsXQAw////AP///wD///8A////AP///wD///8At309ELd9PaC3fT3/t309/7d9Pf+3fT3/rF0A/6xdAP+sXQD/rF0A/6xdAKCsXQAQ////AP///wD///8At309gLd9PfC3fT3/t309/7d9Pf+3fT3/t309/6xdAP+sXQD/rF0A/6xdAP+sXQD/rF0A8KxdAID///8A////AK1fBPCzcyn1t309/7d9Pf+3fT3/t3098Ld9PYCsXQCArF0A8KxdAP+sXQD/rF0A/6xdAP+sXQD/////AP///wCsXQD/rF0A/65jC+u1dzL/t309oLd9PRD///8A////AKxdABCsXQCgrF0A/6xdAP+sXQD/rF0A/////wD///8ArF0A/6xdAP+sXQD/eV09wGBdXKBgXVwQ////AP///wD///8AnpuZUJ+XkMysXQDArF0A/6xdAP////8A////AKxdAP+sXQD/rF0A/3ldPcBgXVz/YF1c8GBdXICem5lgnpuZ4J6bmf+em5n/////AKxdAFCsXQDg////AP///wCsXQD/rF0A/6xdAP95XT3AYF1c/2BdXP9gXVz/npuZ/56bmf+em5n/npuZ/////wD///8A////AP///wD///8ArF0A/6xdAP+sXQD/eV09wGBdXP9gXVz/YF1c/56bmf+em5n/npuZ/56bmf////8A////AP///wD///8A////AKxdAP+sXQD/rmML6KVyOv9vY1foYF1c/2BdXP+em5n/npuZ/5+Xj/CndTz2rF0A0KxdADD///8A////AP///wCtXwTws3Mp9bd9Pf+3fT3/t309/5tzR/VmX1rwn5eP8Kd1PPasXQD/rF0A/6xdAP+sXQD/rF0AgP///wD///8At309gLd9PfC3fT3/t309/7d9Pf+3fT3/t309/6xdAP+sXQD/rF0A/6xdAP+sXQD/rF0A8KxdAID///8A////AP///wC3fT0Qt309oLd9Pf+3fT3/t309/7d9Pf+sXQD/rF0A/6xdAP+sXQD/rF0AoKxdABD///8A////AP///wD///8A////AP///wC3fT0wt309wLd9Pf+3fT3/rF0A/6xdAP+sXQDArF0AMP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wC3fT1Qt3094KxdAOCsXQBQ////AP///wD///8A////AP///wD///8A/D8AAPAPAADAAwAAgAEAAIABAACBgQAAgcEAAIAJAACADwAAgA8AAIADAACAAQAAgAEAAMADAADwDwAA/D8AAA=="

$iconBytes       = [Convert]::FromBase64String($iconBase64)

$stream          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)

$stream.Write($iconBytes, 0, $iconBytes.Length);

$iconImage       = [System.Drawing.Image]::FromStream($stream, $true)

$Generate_PSM_RDP_File.Icon = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())

 

################End of Form Definition###############

#####################################################

 

 

function Hide-Console

{

    $consolePtr = [Console.Window]::GetConsoleWindow()

    #0 hide

    [Console.Window]::ShowWindow($consolePtr, 0)

}

 

###################Define Elements###################

#####################################################

#Element1 - Username

$lbl_Username                    = New-Object system.Windows.Forms.Label

$lbl_Username.text               = "Username"

$lbl_Username.AutoSize           = $true

$lbl_Username.location           = New-Object System.Drawing.Point($label_x,($line1_y*$i))

$lbl_Username.Font               = "$($font_type),$($lbl_font_size)"

 

$txt_Username                    = New-Object system.Windows.Forms.TextBox

$txt_Username.multiline          = $false

$txt_Username.AutoSize           = $true

$txt_Username.width              = $txt_width

$txt_Username.height             = $txt_height

$txt_Username.location           = New-Object System.Drawing.Point($txt_x,($line1_y*$i))

$txt_Username.Font               = "$($font_type),$($txt_font_size)"

$i++

 

#Element2 - RADIUS Token

$lbl_Token                    = New-Object system.Windows.Forms.Label

$lbl_Token.text               = "MFA Token"

$lbl_Token.AutoSize           = $true

$lbl_Token.location           = New-Object System.Drawing.Point($label_x,($line1_y*$i))

$lbl_Token.Font               = "$($font_type),$($lbl_font_size)"

 

$txt_Token                    = New-Object system.Windows.Forms.TextBox

$txt_Token.multiline          = $false

$txt_Token.AutoSize           = $true

$txt_Token.width              = $txt_width

$txt_Token.height             = $txt_height

$txt_Token.location           = New-Object System.Drawing.Point($txt_x,($line1_y*$i))

$txt_Token.Font               = "$($font_type),$($txt_font_size)"

$i++

 

#Element3 - Connection Site - Dropdown - 

$lbl_Connection_Site              = New-Object system.Windows.Forms.Label

$lbl_Connection_Site.text         = "Data Center"

$lbl_Connection_Site.AutoSize     = $true

$lbl_Connection_Site.location     = New-Object System.Drawing.Point($label_x,($line1_y*$i))

$lbl_Connection_Site.Font         = "$($font_type),$($lbl_font_size)"

 

$dd_Connection_Site               = New-Object System.Windows.Forms.ComboBox

$dd_Connection_Site.AutoSize      = $true

$dd_Connection_Site.width         = $txt_width

$dd_Connection_Site.height        = $txt_height

$dd_Connection_Site.location      = New-Object System.Drawing.Point($txt_x,($line1_y*$i))

$dd_Connection_Site.Font          = "$($font_type),$($txt_font_size)"

$dd_Connection_Site.DropDownStyle = "DropDownList"

$dd_Connection_Site.Items.AddRange(@('DataCenter1','DataCenter2','DataCenter3','DataCenter4'))

$i++

 

#Element3 - Application - Dropdown

$lbl_Connection_Application              = New-Object system.Windows.Forms.Label

$lbl_Connection_Application.text         = "Application"

$lbl_Connection_Application.AutoSize     = $true

$lbl_Connection_Application.location     = New-Object System.Drawing.Point($label_x,($line1_y*$i))

$lbl_Connection_Application.Font         = "$($font_type),$($lbl_font_size)"

 

$dd_Connection_Application               = New-Object System.Windows.Forms.ComboBox

$dd_Connection_Application.AutoSize      = $true

$dd_Connection_Application.width         = $txt_width

$dd_Connection_Application.height        = $txt_height

$dd_Connection_Application.location      = New-Object System.Drawing.Point($txt_x,($line1_y*$i))

$dd_Connection_Application.Font          = "$($font_type),$($txt_font_size)"

$dd_Connection_Application.DropDownStyle = "DropDownList"

$dd_Connection_Application.Items.AddRange(@('Chrome','Firefox','Internet Explorer'))

$i++

 

 

#Element4 - Account Type - Radio Button - Domain or Local (Default: Domain)

$bttn_Connect                       = New-Object System.Windows.Forms.Button

$bttn_Connect.Location              = New-Object System.Drawing.Point(($form_width/3),($line1_y*$i))

$bttn_Connect.AutoSize              = $true

$bttn_Connect.Font                  = "$($font_type),$($lbl_font_size)"

$bttn_Connect.Text                  = "Launch Application"

$i++;

 

$lbl_Status = New-Object System.Windows.Forms.Label

$lbl_Status.Location              = New-Object System.Drawing.Point($lbl_x,($line1_y*$i))

$lbl_Status.AutoSize = $true

$lbl_Status.Text = ""

$lbl_height = 80

$lbl_Status.Font                  = "$($font_type),$($lbl_font_size)"

$lbl_Status.ForeColor = "Red"

 

$statusbar = New-Object System.Windows.Forms.StatusBar

$statusbar.Text = "Cyberark App Launcher GUI"

 

 

###################End of Elements###################

#####################################################

 

 

 

 

#####################################################

###############Default Element Values################

#Element1 - Get Logged In Username & Domain

$txt_Username.Text = "$env:USERNAME"
$launchapp = $false

#################End Default Values##################

#####################################################

 

 

 

 

#####################################################

#############Button Click Function###################

$bttn_Connect.Add_Click(

{

    $flag_Validation_error = 0

    $lbl_Status.Text = "Error:"

 

   

    #Validate Username

    if ($txt_Username.Text -eq $null -or $txt_Username.Text -eq '' -or $txt_Username.Text -eq "")

    {

        $lbl_Status.Text += "`n`rUsername Value Missing"

        $flag_Validation_error = 1

    }

 

     #Validate Token

    if ($txt_Token.Text -eq $null -or $txt_token.Text -eq '' -or $txt_token.Text -eq "")

    {

        $lbl_Status.Text += "`n`rMFA Token Missing"

        $flag_Validation_error = 1

    }

   

    

    if($flag_Validation_error)

    {

        return

    }

    else

    {

        $lbl_Status.Text = ""

        $username = $txt_Username.Text

 

        if($dd_Connection_Site.SelectedItem -eq "DataCenter1")

        {

            if($dd_Connection_Application.SelectedItem -eq "Chrome"){

                $lbl_Status.Text += "`n`rLoading Chrome from DataCenter 1"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC1PSM`",`n    `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-Chrome`",`n                  `"ConnectionType`":`"RDPFile`"`n             }`n}"

                write-host $body

            }elseif($dd_Connection_Application.SelectedItem -eq "Firefox")

            {

                $lbl_Status.Text += "`n`rLoading Firefox from DataCenter 1"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC1PSM`",`n    `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-Firefox`",`n                     `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }elseif($dd_Connection_Application.SelectedItem -eq "Internet Explorer")

            {

                $lbl_Status.Text += "`n`rLoading Internet Explorer from DataCenter 1"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC1PSM`",`n    `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-IE`",`n                               `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }

           

        }

        elseif($dd_Connection_Site.SelectedItem -eq "DataCenter2")

        {

            if($dd_Connection_Application.SelectedItem -eq "Chrome"){

                $lbl_Status.Text += "`n`rLoading Chrome from DataCenter2"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC2PSM`",`n        `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-Chrome`",`n                  `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }elseif($dd_Connection_Application.SelectedItem -eq "Firefox")

            {

                $lbl_Status.Text += "Loading Firefox from DataCenter2"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC2PSM`",`n        `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-Firefox`",`n                     `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }elseif($dd_Connection_Application.SelectedItem -eq "Internet Explorer")

            {

                $lbl_Status.Text += "Loading Internet Explorer from DataCenter2"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC2PSM`",`n        `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-IE`",`n                               `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }

        }

        elseif($dd_Connection_Site.SelectedItem -eq "DataCenter3")

        {

            if($dd_Connection_Application.SelectedItem -eq "Chrome"){

                $lbl_Status.Text += "Loading Chrome from DataCenter3"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC3PSM`",`n    `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-Chrome`",`n                  `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }elseif($dd_Connection_Application.SelectedItem -eq "Firefox")

            {

                $lbl_Status.Text += "Loading Firefox from DataCenter3"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC3PSM`",`n    `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-Firefox`",`n                     `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }elseif($dd_Connection_Application.SelectedItem -eq "Internet Explorer")

            {

                $lbl_Status.Text += "Loading Internet Explorer from DataCenter3"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC3PSM`",`n    `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-IE`",`n                               `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }

        }

        elseif($dd_Connection_Site.SelectedItem -eq "Datacenter4")

        {

            if($dd_Connection_Application.SelectedItem -eq "Chrome"){

                $lbl_Status.Text += "Loading Chrome from DataCenter 4"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC4PSM`",`n     `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-Chrome`",`n                  `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }elseif($dd_Connection_Application.SelectedItem -eq "Firefox")

            {

                $lbl_Status.Text += "Loading Firefox from Datacenter 4"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC4PSM`",`n     `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-Firefox`",`n                     `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }elseif($dd_Connection_Application.SelectedItem -eq "Internet Explorer")

            {

                $lbl_Status.Text += "Loading Internet Explorer from DataCenter 4"

                $launchapp = $true

                $body = "{`n     `"UserName`":`"$username`",`n `"Secret`":`"xxxx`",`n      `"Address`":`"AppLauncherGUI`",`n                `"PlatformId`":`"DC4PSM`",`n     `"extraFields`":{},`n         `"PSMConnectPrerequisites`": {`n                             `"ConnectionComponent`":`"PSM-IE`",`n                               `"ConnectionType`":`"RDPFile`"`n             }`n}"

            }

        }#end of Else

 

 

       

        #

        #Authenticate and Launch Application

        #

        #

        if($launchApp -eq $true){

        $cyberarkserver = "https://CyberarkURL.domain.com"

       

        $passw = $txt_Token.Text

        $post = "Post"

        $get = "get"

        $logonbody = ""

        $header = ""

        $logontoken = ""

 

        #
        #Authenticate using RSA token
        #
        $Radius_Logon = $cyberarkserver + "/PasswordVault//API/auth/RADIUS/Logon"

        $logonbody = @{ username=$username;password=$passw} | ConvertTo-Json

        $lbl_Status.Text += "`n`rAuthenticating....`r`n"

                        try{

                # Logon

               [Net.ServicePointManager]::Securityprotocol = [Net.SecurityProtocolType]::tls12

                $logontoken = Invoke-RestMethod -uri $Radius_Logon -method $post -ContentType "application/json" -Body $logonBody -Verbose

                #write-host "TOKEN:" $logontoken -ForegroundColor green

                $logonHeader =  New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

                $logonHeader.Add("Authorization", $logonToken)

 

           }

            catch

            {

                                        $lbl_Status.Text += $_.Exception.Response.StatusDescription

                                        $logonToken = ""

           }

 

        #check if authentication worked properly

        if(!$logontoken){

            $lbl_Status.Text += "`r`nAuthentication Failed"

        }

 

 

        write-host "Generating RDP File..." -ForegroundColor yellow

        $psmURL = $CyberarkServer + "/PasswordVault//api/Accounts/AdHocConnect"

        $curheader = $logonheader

           

            if(($body) -and ($logontoken) ){

            [Net.ServicePointManager]::Securityprotocol = [Net.SecurityProtocolType]::tls12

            $RDPDetails = Invoke-RestMethod -uri $psmURL -method post -header $curheader -ContentType "application/json" -body $body -Verbose

 

            write-host $curheader -ForegroundColor yellow -BackgroundColor black

            write-host $body -ForegroundColor yellow -BackgroundColor black

            

            #Generate RDP File

            $temppath = $env:TEMP

            $date = get-date -Format MMddyy-hhmmss

            $RDPfileLocation = $temppath + "\" + "CyberarkLauncher-" + $date + ".rdp"

            $RDPfileLocation

            Add-Content $RDPfileLocation $RDPDetails

                        #Launch RDP file

            Start-Process $RDPfileLocation

            $txt_token.Text = ""

            }# end of If statement for body

        }#end of launchapp if statement

    }#end of else

})#end of button click

 

#Load the GUI

Hide-Console | Out-Null

$Generate_PSM_RDP_File.controls.AddRange(@($lbl_Username,$txt_Username,$lbl_token, $txt_token, $lbl_Connection_Site,$dd_Connection_Site,$lbl_connection_application,$dd_Connection_application,$bttn_Connect,$lbl_Status,$statusbar))

$Generate_PSM_RDP_File.ShowDialog()