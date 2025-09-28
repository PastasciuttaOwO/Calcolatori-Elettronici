;crea un programma che conta le ripetizioni 
;di lettere all'interno di una stringa

.MODEL SMALL
.STACK 100h
.DATA

    v DB '43125$'
    term DB 13, 10, '$'

.CODE

.STARTUP

    MOV AX, @DATA
    MOV DS, AX
    MOV DI, 0


Bubble1:
    MOV SI, 0
Bubble2:
    MOV AL, [v + SI + 1]
    CMP [v + SI], AL
    JL noswap
    XCHG [v + SI], AL
    MOV [v + SI + 1], AL
noswap:
    INC SI
    CMP SI, 4
    JL Bubble2
    INC DI
    CMP DI, 4
    JL Bubble1
    
    MOV SI, 0
    MOV AH, 09H
    MOV DX, OFFSET v
    INT 21H

    MOV AH, 4CH
    INT 21H

END