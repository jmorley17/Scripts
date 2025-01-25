This script was developed by Joe Morley.
It is a compilation of various other scripts I have found dealing with this same issue. It is a more comprehensive fix which I have found necessary in most cases that I have dealt with. 

WMI may need repair if these symptoms occur:
- Group policy update reports error that processing of group policy failed. Windows could not evaluate the Windows Management Instrumentation filter for the group policy object...
- Software Center reports error You'll need a new app to open this software center link
- Installations fail with error that PC currently does not have enough free hard disk space to accommodate teh install even though the drive is not full
- WMI Control in Microsoft Management Console reports WMI: Invalid Class errors
- Event viewer or CCM logs report WMI corruption errors

WMI repairs are invasive and can affect the operability of certain software.
RUN AT YOUR OWN RISK!

Steps for running WMI repair:
1. WMI Repair script must be run from an elevated command prompt.
2. The easiest way is to FTP into the computer to drop the script into a folder of the affected computer.
3. Open elevated command prompt.
4. Navigate to the folder in which the script is located.
5. Type the name of the script and hit enter.
6. After running the script, reboot the computer.
7. After rebooting, you will need to re-install software center.
