@echo off

:::::::::::::::
:: VARIABLES :: -- Set these to your desired values
:::::::::::::::

SET varName=printer_hostname
SET varIP=printer_ip

:: Location of driver INF file - Use the exact file path from the location of this batch file
SET varDriverFile=path_to_inf_file/driver.INF

:: Use the exact name of the printer...this can be found within the .INF file
:: example : SET varDriver=FF Apeos C3070 PCL 6 (please verify the .INF driver file)
SET varDriver=DriverPrinterName

:: Current File Location (no need to change this)
SET VarCurrentPath=%~dp0

:::::::::::::::::::::::::::::::::::
:: Software Installation Notice ::
:::::::::::::::::::::::::::::::::::

cls
echo Installing %varName%
echo Please wait............

:: Deletes any printer currently setup with this IP
wmic printer where "PortName LIKE '%varIP%'" delete

:: Create TCP/IP port 
:: lpr : Line Printer Daemon protocol
:: 515 - 9100 : port
:: raw : raw printer protocol
:: CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prnport.vbs -a -r %varIP% -o raw -n 9100 -h %varIP%
CSCRIPT /nologo %windir%\System32\Printing_Admin_Scripts\en-US\prnport.vbs -a -r %varIP% -o lpr -n 515 -h %varIP%

:: Install printer
rundll32 printui.dll,PrintUIEntry /if /n "%varName%" /b "%varName%" /f "%VarCurrentPath%%varDriverFile%" /r %varIP% /m "%varDriver%"

:: Stop Windows Managing the default printer
REG ADD "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "LegacyDefaultPrinterMode" /t REG_DWORD /d "1" /f

:: Make Printer the Default (optinal - uncomment the line below if u need this)
:: RUNDLL32 PRINTUI.DLL,PrintUIEntry /y /n "%varName%"

cls
::echo %varName% is installed and set as the default printer
echo Exiting..........
TIMEOUT /T 3
EXIT /B