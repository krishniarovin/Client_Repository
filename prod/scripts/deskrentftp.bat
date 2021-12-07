c:
cd \phh\client
copy \\mbs-csrvr-vs6\mktaccessftp\DeskRent\DeskRentcontrol.txt
copy \\mbs-csrvr-vs6\mktaccessftp\DeskRent\DeskRentbatch.txt
ftp -s:DeskRentftpcmd.txt 161.178.91.1 
rem pause



