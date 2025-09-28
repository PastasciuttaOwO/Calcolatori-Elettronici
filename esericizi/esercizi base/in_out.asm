;scrivo un programma assembly che legge 
;due numeri da tastiera e li somma
;e li stampa su schermo
;il programma deve essere in assembly

.MODEL SMALL
.STACK 100H
.DATA
        num1 DB ?
        num2 DB ?
        dom1 DB 'Inserire il primo numero',13,10,'$'
        dom2 DB 'Inserire il secondo numero',13,10,'$'
        ris1 DB 'la somma dei due numeri e',13,10,'$'
        SOMMA DB ?
.CODE
.STARTUP
        MOV AX, @DATA
        MOV DS, AX ;non è possibile fare direttamente MOV DS, @DATA perchè in 8086 non è un operando valido

        MOV AH, 09H
        MOV DX, OFFSET dom1
        INT 21H

        MOV AH, 01H
        INT 21H
        MOV num1, AL

        MOV AH, 09H
        MOV DX, OFFSET dom2
        INT 21H

        MOV AH, 01H
        INT 21H
        MOV num2, AL

        MOV AL, num1
        
        ADD AL, num2
        MOV SOMMA, AL

        MOV AH, 09H
        MOV DX, OFFSET ris1
        INT 21H

        SUB SOMMA, 30H

        MOV AH, 02H
        MOV DL, SOMMA
        INT 21H
        
        MOV AH, 4CH
        INT 21H
END