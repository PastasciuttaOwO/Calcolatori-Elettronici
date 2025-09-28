.MODEL MEDIUM
.STACK 100h
.DATA

    var1 DB 5
    var2 DB 3
    ris DB ?

.CODE

    FUNZIONE PROC NEAR


    RET
    FUNZIONE ENDP

.STARTUP

    MOV AX, @DATA
    MOV DS, AX

    MOV CH, 0
    MOV CL, var1
    MOV DH, 0
    MOV DL, var2

    MOV AH, 4Ch
    INT 21h
    
END