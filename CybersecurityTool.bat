@echo off
setlocal enabledelayedexpansion
title Cybersecurity Tool
goto menu
:menu
cls
echo 888b     d888           .d8888b.
ping 127.0.0.1 -n 1 -w 800 > nul 
echo 8888b   d8888          d88P  Y88b
ping 127.0.0.1 -n 1 -w 800 > nul
echo 88888b.d88888          888    888 
ping 127.0.0.1 -n 1 -w 800 > nul
echo 888Y88888P888 888d888  888 
ping 127.0.0.1 -n 1 -w 800 > nul     
echo 888 Y888P 888 888P"    888  88888 
ping 127.0.0.1 -n 1 -w 800 > nul
echo 888  Y8P  888 888      888    888 
ping 127.0.0.1 -n 1 -w 800 > nul
echo 888   "   888 888  d8b Y88b  d88P 
ping 127.0.0.1 -n 1 -w 800 > nul
echo 888       888 888  Y8P  "Y8888P88 
ping 127.0.0.1 -n 1 -w 800 > nul
echo.
color 0B
echo ============================================
echo Cybersecurity Tool [V-1.2]   (For Windows Only)
echo                               ----------------
echo                                       ~Mr.G 
echo ============================================
echo.
echo            1) Ping a Target
echo            2) Display System Information
echo            3) Display Network Statics/ports of System
echo            4) Display Route Packets to Destination of a Target
echo            5) Display Network Connections
echo            6) Connect to SSH Sever (Get SSH session)
echo            7) Connect to FTP Server (Get FTP session)
echo            8) Connect to RDP Session
echo            9) List all the Tasks(programmes)
echo           10) Terminate Task using PID/Image name
echo           11) Exit
echo           12) Update Tool
echo           13) Connect with me :)
echo           14) More Tools
echo.
set /p input="Choose an Option:"
echo.
if "%input%" EQU "1" (
    set /p Target="Enter Host name/IP Address:"
    ping "%Target%"
    pause
    cls
    goto menu
)

if "%input%" EQU "2" (
    systeminfo
    pause
    cls
    goto menu
)

if "%input%" EQU "3" (
    netstat -an
    pause
    cls
    goto menu
)

if "%input%" EQU "4" (
    set /p Target="Enter Hostname/IP Address:"
    tracert "%Target%"
    pause
    cls
    goto menu
)

if "%input%" EQU "5" (
    netstat -a
    pause
    cls
    goto menu
)

if "%input%" EQU "6" (
    set /p username="Enter Username:"
    set /p serverip="Enter Server IP:"
    ssh "%username%"@"%serverip%"
    pause
    cls
    goto menu
)

 if "%input%" EQU "7" (
    echo Press "P" to connect to a specific port
    echo Press "W" to connect with Default port
    echo.
    choice /c PW /n /m "Enter your choice:"
    if errorlevel 2 goto connect_noport
    if errorlevel 1 goto connect_with_port
    
    :connect_with_port
    set /p host="Enter Host IP/Address:"
    set /p port="Enter port No:"
    ftp "%host%":"%port%"
    pause
    cls
    goto menu

    :connect_noport
    set /p hostname="Enter Host IP/Address:"
    ftp "%hostname%"
    pause
    cls
    goto menu
 )

 if "%input%" EQU "8" (
    echo Press "P" to connect with Specific Port
    echo Press "W" to connect with Default Port
    echo.
    choice /c PW /n /m "Enter Your Choice:"
    if errorlevel 2 goto connect_without_port
    if errorlevel 1 goto connect_with_port

    :connect_with_port
    set /p portnum="Enter Port Number:"
    set /p iphost="Enter Host Name/IP:"
    mstsc /v:"%iphost%:%portnum%"
    pause
    cls
    goto menu

    :connect_without_port
    set /p rdp="Enter Remote Host Name/IP:"
    mstsc /v:"%rdp%"
    pause
    cls
    goto menu
 )

 if "%input%" EQU "9" (
    tasklist
    pause
    cls
    goto menu
 ) 

 if "%input%" EQU "10" (
    set /p task="Enter Task PID/Image Name:"
    taskkill /PID "%task%" /F
    pause
    cls
    goto menu
 )

 if "%input%" EQU "11" (
    echo Bye!! Keep Learning...
    timeout /t 2 /nobreak > nul
    exit
 )

if "%input%" EQU "12" (
    cls
    echo Connecting to the server...
    timeout /t 2 /nobreak >nul
    :reconnect
    ping 8.8.8.8 >nul
    if errorlevel 1 (
        echo There was an error connecting to the server,please check your internet and try again!!
        echo Trying to reconnect...
        timeout /t 2 /nobreak >nul
        echo.
        cls 
        goto reconnect
        
    ) else (
        echo Connection to the server established!!
        echo.
        timeout /t 2 /nobreak >nul
        echo Updating the script,please wait...
        timeout /t 2 /nobreak >nul 
        powershell -Command "Invoke-webRequest -Uri https://raw.githubusercontent.com/ganeshrajpurohit654/Cyber-Security-Tool-By-Mr.G/main/CybersecurityTool.bat -OutFile CybersecurityTool.bat" >nul


        if not exist CybersecurityTool.bat (
            echo The Updated file is missing,please contact developer for help!!
            timeout /t 2 /nobreak >nul
            echo.
            pause 
            cls
            goto menu

        ) else ( 
            cls 
            echo The Tool Updated Successfully!!
            timeout /t 2 /nobreak >nul
            cls
            call CybersecurityTool.bat && del "%~f0"
        )      
    )
)

 if "%input%" EQU "13" (
    start https://www.instagram.com/anons656
    pause
    cls
    goto menu
 )

 if "%input%" EQU "14" (
    echo Connecting you to Tools Stuff by Mr.G
    echo Kindly give a start to my repo if you like it.
    timeout /t 4 /nobreak >nul
    start https://github.com/ganeshrajpurohit654/
    goto menu
 )
