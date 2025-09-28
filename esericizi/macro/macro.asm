.MODEL SMALL
.STACK 100h
.DATA

    str1 DB 'Ciao', '$'
    str2 DB 'Mondo', '$'
    acapo DB 13, 10, '$'

.CODE
.STARTUP

STAMPA  MACRO stringa
        MOV AH, 09H
        MOV DX, OFFSET stringa
        INT 21H
        ENDM

    MOV AX, @DATA
    MOV DS, AX


    stampa str1
    stampa str2

    MOV AH, 4CH
    INT 21H
END