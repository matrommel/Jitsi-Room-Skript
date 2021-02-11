@echo off
REM LKTools Jitsi Rooms V1
REM ++++++++++++++++++++++++++
REM by Matthias Rommel
REM ReleaseDate: 2021-02-11

set JitsiBasicurl=https://4365-jitsi-9ba14.nws.netways.de/
set EtherpadBasicUrl=https://etherpad.wikimedia.org/p/

REM Ask for user input
set /P room="Raumbezeichnung: "

:enter_amount
set /P "amount=Anzahl der Raeume: "
echo %amount%|findstr /r "[^0-9]" && (
    echo Zahl eingeben
    goto :enter_amount
)

REM Create Logfile
echo Erstellte Links:>StartJitsiRooms_Result.txt
echo.>>StartJitsiRooms_Result.txt

REM Lege Raueme an für angegeben Anzahl in der angegeben Menge
FOR /L %%X IN (1,1,%amount%) DO (
   start "" "C:\Users\mrommel\AppData\Local\Google\Chrome\Application\chrome.exe" -url "%JitsiBasicurl%%room%%%X"
   REM start "" "%basicurl%%room%%%X"
   echo %JitsiBasicurl%%room%%%X>>StartJitsiRooms_Result.txt
   echo Raum %%X gestartet.
   REM timeout /t 1
)

@echo off

REM Falls Etherpads angelegt werden, dann...

echo.>>StartJitsiRooms_Result.txtecho.>>StartJitsiRooms_Result.txt
echo Erstellte Räume:>>StartJitsiRooms_Result.txt
echo.>>StartJitsiRooms_Result.txt

REM Start also etherpads
FOR /L %%X IN (1,1,%amount%) DO (
   echo %EtherpadBasicUrl%%room%%%X>>StartJitsiRooms_Result.txt
   REM timeout /t 1
)

start "" StartJitsiRooms_Result.txt

exit