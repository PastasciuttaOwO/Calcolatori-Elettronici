.MODEL MEDIUM
.STACK 100h
.DATA

    str1 DB "Hello World$"

.CODE

    stampa PROC NEAR
    MOV AH, 09H
    LEA DX, str1
    INT 21h
    RET
    stampa ENDP

.STARTUP

    MOV AX, @DATA
    MOV DS, AX

    CALL stampa

    MOV AH, 4Ch
    INT 21h
    
END