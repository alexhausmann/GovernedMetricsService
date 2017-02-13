@ECHO OFF

sc query "QlikEAPowerToolsServiceDispatcher"

IF %ERRORLEVEL% EQU 0 (GOTO END) ELSE (GOTO ADDSERVICE)

:ADDSERVICE
echo Enter the path and executable for the powertools service:
set /P theBinPath=

sc create QlikEAPowerToolsServiceDispatcher binPath= "%theBinPath%" DisplayName= "Qlik EAPowerTools Service Dispatcher" start= auto
sc description "QlikEAPowerToolsServiceDispatcher" "Service Dispatcher for running EA Powertools" 

sc start QlikEAPowerToolsServiceDispatcher

TIMEOUT /T 10

:END


