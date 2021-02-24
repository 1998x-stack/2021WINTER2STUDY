@echo off  
setlocal
setlocal ENABLEDELAYEDEXPANSION
set path="D:\softwareE\MATLAB\toolbox\genetic"
set suf="*.M"
rem %path% #使用变量
for /f "delims=" %%i in ('dir /b/s/a-d %path%\%suf%') do (
  set h="%%~ni"
  for %%j in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do set h="!h:%%j=%%j!"
  ren "%%i" "!h!"%suf%
)

Endlocal