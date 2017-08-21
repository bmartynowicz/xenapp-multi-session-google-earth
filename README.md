# xenapp-multi-session-google-earth
Using the sysinternal tools handle.exe to kill mutex processes when opening Google Earth on a XenApp server.

You will need to download the sysinternal tool, and place it into the script execution directory.  Once this is done you can modify the "Google Earth" value to the mutex value of any application you would like to kill on a Citrix Server.  This is useful if an application creates mutex processes which prevent additional copies of an application from being launched.

Credit to Mark Russinovich @ Sys Internals, they make great products please use and support their tool set
Credit to Gene Yoo @ Login VSI for scripting this to address a problem which developed during testing
Credit to Dennis Geerlings for his input on findings a solution to the problem experienced during development

This ps1 script can also be wrapped in a loop to execute a an interval or continually.  We have seen some issues with the script crashing during load on a server, so your mileage may vary.
