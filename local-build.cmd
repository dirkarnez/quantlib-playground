REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOAD_DIR=%USERPROFILE%\Downloads
set DOWNLOAD_DIR_LINUX=%DOWNLOAD_DIR:\=/%
SET PATH=%DOWNLOAD_DIR%\PortableGit\bin;%DOWNLOAD_DIR%\mingw64-win32;%DOWNLOAD_DIR%\mingw64-win32\bin;%DOWNLOAD_DIR%\cmake-3.22.0-rc1-windows-x86_64\bin;
cmake.exe -G"MinGW Makefiles" ^
-DBUILD_SHARED_LIBS=OFF ^
-DBOOST_ROOT="P:/Downloads/cpp-libraries/boost/lib/cmake/Boost-1.78.0" ^
-DCMAKE_INSTALL_PREFIX="%~dp0build/QuantLib" ^
-DQL_BUILD_BENCHMARK=OFF ^
-DQL_BUILD_EXAMPLES=OFF ^
-DQL_BUILD_TEST_SUITE=OFF ^
-B./build
cd build

:rebuild_and_startapp
mingw32-make.exe install
pause
REM GOTO rebuild_and_startapp
