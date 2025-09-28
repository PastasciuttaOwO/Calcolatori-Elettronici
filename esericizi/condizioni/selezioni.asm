; Fai un codice che mettete a paragone tre numeri e stampa il più grande

.MODEL SMALL
.STACK 100H
.DATA
        var1 DB ?
        var2 DB ?
        var3 DB ?
        dom1 DB 'Inserisci il primo valore', 13, 10, '$'
        dom2 DB 'Inserisci il secondo valore', 13, 10, '$'
        dom3 DB 'Inserisci il terzo valore', 13, 10, '$'
        terminatore DB 13, 10, '$'
        msg DB 'Il numero maggiore e: ', '$'
.CODE
.STARTUP
        MOV AX, @DATA
        MOV DS, AX

        MOV AH, 09H
        MOV DX, OFFSET dom1 ;Domanda 1
        INT 21H

        MOV AH, 01H
        INT 21H ;Input Variabile
        MOV var1, AL

        MOV AH, 09H
        MOV DX, OFFSET terminatore ;A capo
        INT 21H

        MOV AH, 09H
        MOV DX, OFFSET dom2 ;Domanda 2
        INT 21H

        MOV AH, 01H
        INT 21H ;Input Variabile
        MOV var2, AL

        MOV AH, 09H
        MOV DX, OFFSET terminatore ;A capo
        INT 21H

        MOV AH, 09H
        MOV DX, OFFSET dom3 ;Domanda 3
        INT 21H

        MOV AH, 01H
        INT 21H ;Input Variabile
        MOV var3, AL

        MOV AH, 09H
        MOV DX, OFFSET terminatore ;A capo
        INT 21H

        MOV AH, 09H
        MOV DX, OFFSET msg ;Inizio risposta
        INT 21H

        MOV AL, var1
        CMP AL, var2 ;IF Prime due variabili
        JG Var1Magg
        JMP Var2Magg

Var1Magg:
        CMP AL, var3
        JL Var3Magg

        MOV AH, 02h
        MOV DL, var1 ;Output var1
        INT 21h

        JMP FINESE
Var2Magg:
        MOV AL, var2
        CMP AL, var3
        JL Var3Magg

        MOV AH, 02h
        MOV DL, var2 ;Output var2
        INT 21h

        JMP FINESE
Var3Magg:
        MOV AH, 02h
        MOV DL, var3 ;Output var3
        INT 21h
FINESE: NOP

        MOV AH, 4Ch ;Chiamo la fine del programma
        INT 21H
END