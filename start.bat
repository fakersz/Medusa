@echo off
start artifacts\FXServer.exe +exec config/server.cfg +exec config/scripts.cfg +set onesync_population false +set sv_enforceGameBuild 2372  
exit