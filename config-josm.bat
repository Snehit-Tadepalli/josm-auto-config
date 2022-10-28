set /p OSM_USER_NAME=Please enter your OSM User Name:
cd %USERPROFILE%\Desktop\josm_config\files
powershell -Command "(gc no-user-preferences.xml) -replace 'OSM_USER_ID', '%OSM_USER_NAME%'| Out-File -encoding ASCII preferences.xml"
echo %OSM_USER_NAME%
cd %APPDATA%\JOSM
del /q *
if not exist "plugins" mkdir plugins
cd plugins
dir /a
del /q *
del /a:h /q *
del /s /q *
cd %APPDATA%
cd ..
cd Local\JOSM\cache
del /q mirror*
copy /y %USERPROFILE%\Desktop\josm_config\files\plugins %APPDATA%\JOSM\plugins
copy /y %USERPROFILE%\Desktop\josm_config\files\preferences.xml %APPDATA%\JOSM\preferences.xml
