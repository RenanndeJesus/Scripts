
REM Cria a chave de recuperação, sem ela não é possivel habilitar o bitlocker
manage-bde -protectors -add c: -rp -rk C:\

REM Habilita a Criptografia não executando a verificação de Hardware
manage-bde -on  C: -used -skiphardwaretest

