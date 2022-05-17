# Remote Multiple Shutdown Script v1.0

## What does the script do?
The scripts parses a csv file and performs a remote shutdown command to all
the devices listed in the file.

## How to run:
The script must be run in Windows Powershell

The syntax of the command is: .\remoteshutdown.ps1 <command option> <csv file name>

## Command Options:
s:  Shutdown the computers.\
sg: Shutdown the computers. On the next boot, if Automatic Restart Sign-On\
    is enabled, automatically sign in and lock last interactive user.\
    After sign in, restart any registered applications.\
r:  Full shutdown and restart the computers.\
g:  Full shutdown and restart the computer. After the system is rebooted,\
    if Automatic Restart Sign-On is enabled, automatically sign in and\
    lock last interactive user.\
    After sign in, restart any registered applications.\
a:  Abort a system shutdown.\
    This can only be used during the time-out period.\
    Combine with /fw to clear any pending boots to firmware.\
p:  Turn off the local computers with no time-out or warning.\
h:  Hibernate the computers\
hybrid: Performs a shutdown of the computer and prepares it for fast startup.\
    Must be used with /s option.\
**ANY OTHER ARGUMENTS ARE NOT GUARANTEED TO WORK**

## csv file specifications:
The csv file must contain 3 columns with the headers "ID", "Delay", and "Comment".
The order of the columns does not matter, the rest of the file can contain any other
information. The delay column contains the delay in running the commands, enter 0 for
no delay. The comment column sends an alert to the given computer, enter "" for no 
comment. ID column must contain valid computer names i.e. 0000N0000000000, if
the script is unable to find the computer you will get an error message that looks 
something like this.
`1180N0098019797: The entered computer name is not valid or remote shutdown is not supported on the target computer. Check the name and then try again or contact your system administrator.(53)`

## Example run:
Shuts down all computers listed in the csv file.
`.\remoteshutdown.ps1 s .\testshutdown.csv`

## Output:
```
Attempting to run  s  on:  1180N0098051336
Attempting to run  s  on:  blahblahblah
blahblahblah: The entered computer name is not valid or remote shutdown is not supported on the target computer. Check the name and then try again or contact your system administrator.(53)
Attempting to run  s  on:  1180C0097888242
Attempting to run  s  on:  1180N0098019797
1180N0098019797: The entered computer name is not valid or remote shutdown is not supported on the target computer. Check the name and then try again or contact your system administrator.(53)
```
NOTE: 1180N0098019797 was an invalid computer name.
