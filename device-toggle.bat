@echo off
goto check_permissions

:check_permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
	goto select_task
    ) else (
        echo Error: This .bat file must be run as an administrator
    )

pause >nul

:select_task
    echo Select a task
    echo =============
    echo 1) Disable device
    echo 2) Enable device
    set /p option=Type option:
    if "%option%"=="1" goto disable_device
    if "%option%"=="2" goto enable_device


:disable_device
    set /p name="Enter the name of the device to disable: "
    wmic path Win32_PnPEntity where "name='%name%'" call disable

    pause

:enable_device
    set /p name="Enter the name of the device to enable: "
    wmic path Win32_PnPEntity where "name='%name%'" call enable

    pause