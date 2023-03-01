set INSTANCE=%1
set PROFILE=%2
set SENTINELDATAFOLDER=C:\Users\KevinAndrewLipscomb\AppData\Local\Uniden\BCDx36HP_Sentinel.exe_Url_abqsk2nho02xj05iqogfzzs5adwkwlkr\1.0.0.0
del %SENTINELDATAFOLDER%\user.config
mklink /h %SENTINELDATAFOLDER%\user.config %SENTINELDATAFOLDER%\user---%INSTANCE%---%PROFILE%.config
timeout 1
"C:\Program Files (x86)\Uniden\BCDx36HP Sentinel\BCDx36HP_Sentinel.exe"
