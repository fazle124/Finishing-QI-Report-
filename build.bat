@echo off
title Building Windows Desktop Application (.exe)
color 0B
echo ========================================================
echo   Daily Finishing QI Report - Windows .exe Builder
echo   Colossus Apparel Limited
echo ========================================================
echo.
echo [1/3] Node.js ও NPM প্যাকেজ চেক করা হচ্ছে...
call npm -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] আপনার কম্পিউটারে Node.js ইনস্টল করা নেই!
    echo দয়া করে https://nodejs.org থেকে Node.js ইনস্টল করে নিন।
    pause
    exit /b
)

echo.
echo [2/3] Electron ডিপেন্ডেন্সি ইনস্টল করা হচ্ছে (দয়া করে অপেক্ষা করুন)...
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] প্যাকেজ ইনস্টলে ব্যর্থ হয়েছে!
    pause
    exit /b
)

echo.
echo [3/3] Windows .exe ফাইল তৈরি করা হচ্ছে...
call npm run build:win

echo.
echo ========================================================
echo [SUCCESS] অভিনন্দন! আপনার .exe ফাইল তৈরি সম্পন্ন হয়েছে!
echo ফাইলটি "dist-electron" ফোল্ডারের ভেতর পাবেন।
echo ========================================================
echo.
explorer dist-electron
pause
