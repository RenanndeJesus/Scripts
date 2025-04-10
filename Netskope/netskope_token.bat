@echo off

cd C:\Program Files (x86)\Netskope\STAgent

nsdiag -e enrollauthtoken=0aab817ac8ba76b520c1fe128b247bc6 enrollencryptiontoken=0aab817ac8ba76b520c1fe128b247bc6

timeout 30

exit /b