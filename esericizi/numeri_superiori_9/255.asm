.MODEL SMALL
.STACK 100H
.DATA

    var1 DB 192
    out1 DB 'Il valore e ', '$'

.CODE
.STARTUP
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    MOV DX, OFFSET out1 ;Output di out1
    INT 21H

    MOV AL, var1 ;Copio in AL var1
    MOV AH, 0 ;Rendo AH 0

    MOV CL, 100 ;Copio il valore 100 in CL
    DIV CL ;Divido tutto AX per CL

    MOV BL, AH ;Copio il valore di AH in BL

    ADD AL, 30H ;Aggiungo 30H per poter visualizzare correttamente AL 

    MOV AH, 02H
    MOV DL, AL ;Visualizzo Al
    INT 21H

    MOV AL, BL ;Copio il valore di BL in AL
    MOV AH, 0 ;Azzero AH

    MOV CL, 10 ;Copio 10 in CL
    DIV CL ;Divido AX per CL

    MOV BL, AH ;Salvo il valore di AH in BL
    ADD AL, 30H
    ADD BL, 30H ;Aggiungo 30H per poter visualizzare correttamente AL e BL
    
    MOV AH, 02H
    MOV DL, AL ;Visualizzo AL
    INT 21H

    MOV AH, 02H
    MOV DL, BL ;Visualizzo BL
    INT 21H

    MOV AH, 4CH ;Ridò il comando al DOS
    INT 21H

END