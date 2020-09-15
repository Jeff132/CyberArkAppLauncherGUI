# CyberArkAppLauncherGUI

![ScreenShot](https://raw.githubusercontent.com/Jeff132/CyberArkAppLauncherGUI/master/CyberarkArkAppLauncherGUI.png)


**Overview**

Small App that can be used to allow users to launch applications installed on Cyberark PSM servers. 

**Details**

This will allow the user to select a Datacenter (AKA PSM) and select the application and then login to Cyberark Privilege Access Security using RADIUS. The app will download the RDP fileto the users TEMP folder and then launch the RDP file. Today the application has 3 browsers configured but this can obviously be adjusted to support your environment.

This app is written in powershell and use .NET Windows Forms for the GUI. You can compile it into an executable also, i am working on rewriting this in C#.
