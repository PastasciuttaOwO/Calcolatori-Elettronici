.MODEL SMALL
.STACK 100H
.DATA

    var1 DB '9'
    var2 DB '5'

.CODE
.STARTUP

    MOV AX, @DATA
    MOV DS, AX

    MOV AL, var1 ;copio var1 in AL (AL = 9)
    XCHG AL, var2 ;swap tra al e var2 (var2 = 9, AL = 5)
    MOV var1, AL ;copio AL in var1 (var1 = 5)

    MOV AH, 4Ch
    INT 21H

END