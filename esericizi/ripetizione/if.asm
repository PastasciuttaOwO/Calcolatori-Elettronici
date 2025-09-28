.MODEL SMALL
.STACK 100h
.DATA
        N1 DB 5
        N2 DB 4
        ANSW1 DB 'la condizione e vera', 13, 10, '$'
        ANSW2 DB 'la condizione e falsa', 13, 10, '$'
.CODE
.STARTUP
        MOV AL, N1
        CMP AL, N2
        JG VERO
        JMP FALSO

VERO:   MOV AH, 09H
        MOV DX, OFFSET ANSW1
        INT 21H 
        JMP FINESE

FALSO:  MOV AH, 09H
        MOV DX, OFFSET ANSW2
        INT 21H 

FINESE: NOP

        MOV AH, 4CH
        INT 21H
END