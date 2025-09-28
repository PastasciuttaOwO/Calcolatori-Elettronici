;crea un programma che conta le ripetizioni 
;di lettere all'interno di una stringa

.MODEL SMALL
.STACK 100h
.DATA

    msg1 DB 'Inserisci una parola', 13, 10, '$'
    msg2 DB 'Il numero di ripetizioni e: $'
    acapo DB 13, 10, '$'
    v1_len DW ?
    v2_len DW ?
    v1 DB 30 DUP(?)
    count DB 30h

.CODE

inpvar MACRO var ;Input Variabile
       MOV AH, 01H
       INT 21H
       MOV var, AL
       ENDM
    
inpvett MACRO var ;Input Variabile
        MOV AH, 01H
        INT 21H
        MOV [var + SI], AL
        ENDM

outstr   MACRO var ;Output stringa
         MOV AH, 09H
         MOV DX, OFFSET var
         INT 21h
         ENDM

outvar  MACRO var ;Output Variabile
        MOV AH, 02H
        MOV DL, var
        INT 21H
        ENDM

;check1  MACRO vet1, vet2 controllo se ci son doppie
;        ENDM




.STARTUP

    MOV AX, @DATA
    MOV DS, AX
    MOV SI, 0

    outstr msg1
INPUT:
    inpvett v1
    INC SI
    CMP SI, 30
    JE FINPUT
    CMP AL, 0DH
    JNE INPUT
FINPUT: 
    DEC SI
    MOV [v1 + SI], '$'
    DEC SI

ciclo1: NOP
    MOV DI, SI ;valore salvato in v1_len
i_chk2: DEC DI
        MOV BL, [v1 + DI]
        CMP [v1 + SI], BL
        JNE noequal
        INC count
noequal:NOP
        CMP DI, 0
        JNE i_chk2
    DEC SI
    CMP SI, 1
    JNE ciclo1
    outvar count
    MOV AH, 4CH
    INT 21H

END