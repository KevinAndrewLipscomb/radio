set INSTANCE=%1
set PROFILE=%2
c:\cygwin\bin\sed --in-place --regexp-extended --file="launch-sentinel---%INSTANCE%---%PROFILE%.sed" %LOCALAPPDATA%\Uniden\BCDx36HP_Sentinel.exe_Url_abqsk2nho02xj05iqogfzzs5adwkwlkr\1.0.0.0\user.config
start "" /max "C:\Program Files (x86)\Uniden\BCDx36HP Sentinel\BCDx36HP_Sentinel.exe"
