@echo off
rem Padrão executado no Systrack para executar scripts powershell, é recomendável o .bat chamar o .ps1
rem "%~dp0" representa uma variavel de diretório, onde o script powershell será executado em qualquer caminho que ele faça parte. 

rem Comando para executar o script .ps1
powershell.exe -executionpolicy bypass -file "%~dp0CriarPasta.ps1"