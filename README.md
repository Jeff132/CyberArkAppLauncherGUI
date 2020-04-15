# CyberArkAppLauncherGUI

![ScreenShot](https://raw.githubusercontent.com/Jeff132/CyberArkAppLauncherGUI/master/CyberarkArkAppLauncherGUI.png)


**Overview**

This is a proof of concept to show a GUI can be created to allow users to login to cyberark and launch applications.

**Details**

This will allow the user to select a Datacenter (AKA PSM) and select the application and then login to Cyberark Privilege Access Security using RADIUS. The app will download the RDP fileto the users TEMP folder and then launch the RDP file. Today the application has 3 browsers configured but this can obviously be adjusted to support your environment.

This app is written in powershell and use .NET Windows Forms for the GUI. You can compile it into an executable also, i am working on rewriting this in C#.
