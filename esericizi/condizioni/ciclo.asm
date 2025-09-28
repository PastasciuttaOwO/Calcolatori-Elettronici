;Acquisire numero tra 1 e 9
;Acquisisci tot caratteri
;Controlla quante A maiuscole ci sono

.MODEL SMALL
.STACK 100H
.DATA

    i DB ?
    count DB 30H
    dom1 DB 'Inserisci quanti caratteri vuoi controllare', 13, 10, '$'
    dom2 DB 'Inserisci un carattere', 13, 10, '$'
    answ DB 'Il numero di a e ', '$'
    acapo DB 13, 10, '$'

.CODE
.STARTUP

    MOV AX, @DATA
    MOV DS, AX

Ciclo1:
    MOV AH, 09h
    MOV DX, OFFSET dom1 ;Domanda 1
    INT 21H

    MOV AH, 01H
    INT 21H ;Acquisisco numero e lo salvo in AL
    MOV i, AL

    MOV AH, 09h
    MOV DX, OFFSET acapo ;terminatore
    INT 21H

    MOV AL, i

    CMP AL, '0'
    JLE Ciclo1

    CMP AL, '9'
    JG Ciclo1

    MOV BL, i ;Copio bl in i

Ciclo2:

    MOV AH, 09H
    MOV DX, OFFSET dom2 ;Seconda domanda
    INT 21H

    MOV AH, 01H
    INT 21h ;Acquisisco carattere

    CMP AL, 'A'
    JE SE

    MOV AH, 09h
    MOV DX, OFFSET acapo ;terminatore
    INT 21H

    DEC BL
    CMP BL, '0'
    JE Fine
    JMP Ciclo2

SE:
    MOV AH, 09h
    MOV DX, OFFSET acapo ;terminatore
    INT 21H

    INC count
    DEC BL
    CMP BL, '0'
    JE Fine
    JMP Ciclo2

Fine:
    MOV AH, 09h
    MOV DX, OFFSET answ ;Risposta
    INT 21H

    MOV AH, 02h
    MOV DL, count ;Output variabile
    INT 21h

    MOV AH, 4Ch
    INT 21h
END