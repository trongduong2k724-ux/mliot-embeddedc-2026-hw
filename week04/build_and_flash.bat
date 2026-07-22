@echo off
echo ==============================================
echo       AUTO BUILD AND FLASH SCRIPT (HW03)
echo ==============================================

echo.
echo [1/4] CLEANING OLD BUILD FOLDER...
IF EXIST build (
    rmdir /s /q build
)

echo.
echo [2/4] CONFIGURING CMAKE WITH NINJA...
cmake -G Ninja -DCMAKE_TOOLCHAIN_FILE=arm-none-eabi.cmake -B build
IF %ERRORLEVEL% NEQ 0 (
    echo CMAKE CONFIGURATION FAILED!
    exit /b %ERRORLEVEL%
)

echo.
echo [3/4] BUILDING FIRMWARE...
cmake --build build
IF %ERRORLEVEL% NEQ 0 (
    echo BUILD FAILED!
    exit /b %ERRORLEVEL%
)

echo.
echo [4/4] FLASHING FIRMWARE AND RESETTING CHIP...
STM32_Programmer_CLI -c port=SWD -w build/Learning_Startup.bin 0x08000000 -v -rst
IF %ERRORLEVEL% NEQ 0 (
    echo FLASHING FAILED! Check ST-Link connection.
    exit /b %ERRORLEVEL%
)

echo.
echo ==============================================
echo            SUCCESSFULLY COMPLETED!
echo ==============================================