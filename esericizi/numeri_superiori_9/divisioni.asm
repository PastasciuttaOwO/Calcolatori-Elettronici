.MODEL SMALL
.STACK 100H
.DATA

    cont DB 30H
    char DB ?
    term DB 13, 10, '$'
    dom1 DB 'Inserisci un carattere', '$'
    ris1 DB 'Hai inserito ', '$'
    ris2 DB ' caratteri', '$'

.CODE
.STARTUP
    MOV AX, @DATA
    MOV DS, AX

ciclo1:
    MOV AH, 09h
    MOV DX, OFFSET dom1 ;Mostro dom1
    INT 21H

    MOV AH, 09h
    MOV DX, OFFSET term ;Mostro terminatore
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV char, AL ;Salvo il carattere in char

    MOV AH, 09h
    MOV DX, OFFSET term ;\n
    INT 21H

    INC cont ;Incremento il contatore

    CMP char, ' ' ;verifica ciclo
    JNE ciclo1 ;Se non è uguale a ' ' salto a ciclo1
    
    MOV AL, cont ;Copio il valore di AL count
    SUB AL, 30H ;Lo rendo un valore normale e non ASCII

    MOV AH, 0 ;Azzero AH
    MOV CL, 10 ;Sposto in CL il divisore
    DIV CL ;Effettuo la divisione (Divisore CL dividendo AX)

    MOV BX, AX ; Per pura comodità copio in BX tutto AX
    ADD BL, 30H
    ADD BH, 30H ;Aggiugno sia a BH che a BL il valore 30H per avere i corrispettivi valori ASCII

    MOV AH, 09h
    MOV DX, OFFSET ris1 ;Output ris1
    INT 21H

    MOV AH, 02H
    MOV DL, BL
    INT 21H

    MOV AH, 02H
    MOV DL, BH ;Mostro tutto BX
    INT 21H

    MOV AH, 09h
    MOV DX, OFFSET ris2 ;Output ris2
    INT 21H

    MOV AH, 4CH
    INT 21h

END