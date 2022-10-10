@echo off
mkdir "%USERPROFILE%\Downloads\downloadedVideos"
mkdir "%USERPROFILE%\Downloads\downloadedVideos\tempFolder"
:check
set Cond=
echo What is the address of the video file/playlist you want to download?
set /p Url=(Right click in here to paste a link you have copied) Link: 
echo Alright!
youtube-dl "%Url%" -o "%USERPROFILE%\Downloads\downloadedVideos\tempFolder\%%(title)s.%%(ext)s"
echo.
echo.
echo.
echo ---------------------------------------------------------
echo.
echo.
echo.
echo Download finished.
echo.
echo.
echo You may close the utility now if you don't need to convert the media to MP4.
echo The media is located at %USERPROFILE%\Downloads\downloadedVideos\tempFolder\
echo.
echo.
echo Press e and ENTER to download something else
set /p Cond=Press just ENTER to proceed to conversion:
IF "%Cond%"=="e" (goto :check)
CD %USERPROFILE%\Downloads\downloadedVideos\tempFolder\
for %%A IN (*) DO echo ####################Converting your files to mp4!#################### & ffmpeg -i "%%A" "..\%%A.mp4" & echo ####################Converting your files to mp4!####################
echo.
echo.
echo.
echo.
set /p finisher=####################Process finished, press ENTER to clean up leftovers####################
CD %USERPROFILE%\Downloads\
rmdir /S /Q %USERPROFILE%\Downloads\downloadedVideos\tempFolder
echo Done! The files are located at:
echo "%USERPROFILE%\Downloads\downloadedVideos\"
echo.
echo.
echo Press any key to quit the utility
PAUSE > nul