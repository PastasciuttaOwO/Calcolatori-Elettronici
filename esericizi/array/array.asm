.MODEL SMALL
.STACK 100H
.DATA

    v DB 6 DUP(30H)
    dom1 DB 'Inserisci un carattere: ', '$'
    term DB 13, 10, '$'

.CODE
.STARTUP

    MOV AX, @DATA
    MOV DS, AX

    MOV SI, 0 ;Azzero SI

Ciclo1:
    MOV AH, 09H
    MOV DX, OFFSET dom1 ;Output stringa
    INT 21H

    MOV AH, 09H
    MOV DX, OFFSET term ;Output /n
    INT 21H

    MOV AH, 01H
    INT 21h ;Input carattere e lo salvo in al

    MOV [v + SI], AL ;Copio nel vettore v 
                     ;Alla cella puntata da SI
                     ;(Che incremente a ogni iterazione)
                     ;Il valore in AL preso in input

    INC SI
    
    MOV AH, 09H
    MOV DX, OFFSET term ;Output /n
    INT 21H

    CMP SI, 5
    JL Ciclo1

    MOV [v + SI], '$'
    MOV AH, 09H
    MOV DX, OFFSET v ;Output tutto v
    INT 21H

    MOV AH, 4Ch
    INT 21H

END