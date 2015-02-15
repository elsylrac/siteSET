@echo off
echo SiteSET creates a folder and file structure for most basic web projects.
echo Most input only requires a Y or N keypress.
echo After which, only a [git init] command is needed to begin hackin'.
pause
:BEGIN
cd %USERPROFILE%\Documents\Sites
set /P SiteDirectory= What will you be naming your project?.
mkdir "%SiteDirectory%" && cd "%SiteDirectory%"
mkdir img
type nul > .gitignore & type nul > .htaccess
set /P php= Using PHP[Y/N]?
if /I "%php%" EQU "Y" goto :PHP
if /I "%php%" EQU "N" goto :HTML
goto BEGIN

:HTML
type nul > index.html
goto CSS

:PHP
type nul > index.php
mkdir inc & cd inc
type nul > header.php & type nul > footer.php
mkdir config & cd config
type nul > config.php
cd ..\..
goto CSS

:CSS
mkdir css & cd css
type nul > main.css
set /P sass= Using SASS [Y/N]?
if /I "%sass%" EQU "Y" goto SASS
cd ..
set /P js= Using Javascript[Y/N]?
if /I "%js%" EQU "Y" goto JS
goto

:SASS
mkdir sass & cd sass
echo [Y] for (.scss) extension -- Brackets Syntax
echo [N] for (.sass) extension -- Indent Syntax
set /P scss= [Y/N]?
if /I "%scss%" EQU "Y" (type nul > main.scss)
if /I "%scss%" EQU "N" (type nul > main.sass)
cd ..\..
set /P js= Using Javascript?
if /I "%js%" EQU "Y" goto JS
goto END

:JS
mkdir js & cd js
type nul > app.js
cd ..
goto END

:END
echo Don't forget to [git init] 
echo :-)
pause
exit