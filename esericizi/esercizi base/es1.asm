.MODEL SMALL
.STACK 100H
.DATA
        var1 DB 5
        ris DB ?
.CODE
.STARTUP
        MOV AL, var1
        CMP AL, 0
        JG POSITIVO
        JMP NEGATIVO
POSITIVO:
        MOV ris, 1
        JMP FINESE
NEGATIVO:
        MOV ris, 0
FINESE: 
        MOV AH, 4CH
        INT 21H
END