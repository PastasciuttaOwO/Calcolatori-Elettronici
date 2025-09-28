.MODEL SMALL
.STACK 100H
.DATA
        var1 DB ?
        var2 DB ?
        dom1 DB 'Inserisci il primo valore', 13, 10, '$'
        dom2 DB 'Inserisci il secondo valore', 13, 10, '$'
        msgmaggiore DB 'Il primo numero e maggiore del secondo', 13, 10, '$'
        msgminore DB 'Il primo numero e minore del secondo', 13, 10, '$'
        msguguali DB 'I due numeri sono uguali', 13, 10, '$'
        terminatore DB 13, 10, '$'
.CODE
.STARTUP
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 09H ;Prima domanda
        MOV DX, OFFSET dom1
        INT 21H

        MOV AH, 01H ;Input var1
        INT 21H
        SUB AL, 30H ;Converto il numero da ascii a deci
        MOV var1, AL
        MOV AH, 09H ;Comando messo solo come /n
        MOV DX, OFFSET terminatore
        INT 21H

        MOV AH, 09H ;Domanda 2
        MOV DX, OFFSET dom2
        INT 21H

        MOV AH, 01H ;Input 2
        INT 21H
        SUB AL, 30H ;Converto il numero da ascii a decimale
        MOV var2, AL
        MOV AH, 09H ;Comando messo solo come /n
        MOV DX, OFFSET terminatore
        INT 21H

        MOV AL, var1
        CMP AL, var2
        JG MAGGIORE
        JL MINORE
        JE UGUALI
        JMP FINESE
MAGGIORE:
        MOV AH, 09H
        MOV DX, OFFSET msgmaggiore
        INT 21H

        JMP FINESE
MINORE:
        MOV AH, 09H
        MOV DX, OFFSET msgminore
        INT 21H

        JMP FINESE
UGUALI: 
        MOV AH, 09H
        MOV DX, OFFSET msguguali
        INT 21H
FINESE: 
        MOV AH, 4CH
        INT 21h
END