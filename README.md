# Printer Script Installer


## Running Script :

For MacOS : 

```bash
chmod +X install_printer.sh && sudo ./install_printer.sh
```

For Windows :

Just click and run the `install_printer.bat` to install the printer



## Usage

Search and Replace these line below

### For .bat script:

| Parameter | Function |
| :----: | --- |
| `varName=printer_hostname` | Replace printer_hostname with yours , this is the name of printer you want to create |
| `varIP=printer_ip` | Replace printer_ip with printer IP Addresss |
| `VarDriverFile=path_to_inf_file/driver.INF` | Replace path_to_inf_file/driver.INF with the path of .inf file of your printer |
| `VarDriver=DriverPrinterName` | Replace DriverPrinterName with yours , mention in the .inf file above |
| `lpr` | Line Printer Daemon protocol |
| `raw` | If you want to use raw port, Replace lpr with raw |
| `515` | This is printer port, you may want to replace the port depend on your printer |


If you want to make printer as default printer, delete
`::` before RUNDLL32 PRINTUI.DLL,PrintUIEntry /y /n `%varName%`


### For .sh bash script :

| Parameter | Function |
| :----: | --- |
| `IP1 , IP2, IP3` | Replace with printer IP Addresss |
| `Printer_Name1, Printer_Name2, Printer_Name3` | Replace with Printer Hostname |
| `Driver_Path` | Replace with the path of printer installed, the path may in "/Library/Printers/PPDs/Contents/Resources" |
| `Driver_Installer` | Replace the path to your printer driver pkg file |
| `lpd://$IP/ or ipp://$IP/` | Replace lpd or ipp port, depend on your printer |



## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.



## Reference Link :
[FUJIFILM Printer Drivers for macoS - exported pkg driver file](https://github.com/trongtinh1212/FUJIfILM_Printer_Drivers)

[FUJIFILM Printer Drivers for Windows](https://support-fb.fujIfilm.com/setupSupport.do?cid=8&ctry_code=NZ&lang_code=en)

[Apple CUPS](https://github.com/apple/cups)