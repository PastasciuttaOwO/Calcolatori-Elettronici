;crea un programma che conta le ripetizioni 
;di lettere all'interno di una stringa

.MODEL SMALL
.STACK 100h
.DATA

    v DB 1, 2, 3, 4, 5
    tofind DB ?
    msg1 DB 'Inserisci il valore da trovare (da 0 a 9)', 13, 10, '$'
    msg2 DB 'Il valore e presente$'
    msg3 DB 'Il valore non e presente$'
    term DB 13, 10, '$'

.CODE

inpvar MACRO var ;Input Variabile
       MOV AH, 01H
       INT 21H
       MOV var, AL
       ENDM

outstr   MACRO var ;Output stringa
         MOV AH, 09H
         LEA DX, var
         INT 21h
         ENDM

outvar  MACRO var ;Output Variabile
        MOV AH, 02H
        MOV DL, var
        INT 21H
        ENDM


.STARTUP

    MOV AX, @DATA
    MOV DS, AX
    MOV SI, 0

    outstr msg1
    inpvar tofind
    outstr term
    SUB tofind, 30H
    MOV BL, tofind ;uso il registro bl per fare la cmp

ciclo1:
    CMP [v + SI], BL
    JE FineVero
    INC SI
    CMP SI, 5
    JE FineFalso
    JMP ciclo1

FineVero:
    outstr msg2
    JMP Fine

FineFalso:
    outstr msg3

Fine: NOP
    MOV AH, 4CH
    INT 21H

END