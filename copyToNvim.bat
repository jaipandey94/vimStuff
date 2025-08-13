@echo off
echo Copying Neovim config to local nvim config path...

set "NVIM_CONFIG_DIR=%LOCALAPPDATA%\nvim"

if not exist "%NVIM_CONFIG_DIR%" (
    echo Creating nvim config directory...
    mkdir "%NVIM_CONFIG_DIR%"
)

echo Copying configuration files...
xcopy /E /Y "nvimConfig\*" "%NVIM_CONFIG_DIR%\"

echo Neovim configuration copied successfully!
pause