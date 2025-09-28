.MODEL SMALL
.STACK 100h

.DATA

    var1 DB 2
    var2 DB 3
    risultato DB ?

.CODE
.STARTUP
    MOV AL, var1
    ADD AL, var2
    MOV risultato, AL

    MOV AH, 4CH
    INT 21H
END