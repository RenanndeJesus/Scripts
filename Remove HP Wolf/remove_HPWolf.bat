@echo off
setlocal

echo Verificando se HP Wolf Security esta instalado...
wmic product where "name='HP Wolf Security'" get name
if %errorlevel% neq 1 (
    echo HP Wolf Security nao esta instalado. Finalizando o script.
    echo Operacao concluida software não estava instalada! > C:\temp\Wolf_nao_instalado_log.txt
    exit /b
)

echo Removendo HP Wolf Security...
wmic product where "name='HP Wolf Security'" call uninstall /nointeractive 

echo Removendo HP Wolf Security - Console...
wmic product where "name='HP Wolf Security - Console'" call uninstall /nointeractive 

echo Removendo HP Security Update Service...
wmic product where "name='HP Security Update Service'" call uninstall /nointeractive 

echo Operação concluida!
echo Operação concluida! > C:\temp\uninstall_log.txt

endlocal
exit /b