.MODEL SMALL
.STACK 100H
.DATA
        N1 DB 4
        N2 DB 5
.CODE
.STARTUP
        MOV AL, N1
        CMP AL, N2 ; Compare N1 and N2
        JG VERO ;Jump Greater, qualora N1 > N2 salta all'eticchetta vero
        JMP FALSO ;Jump False, altrimenti salta all'eticchetta falso
VERO:   MOV BL, N1 ; Se N1 > N2, carica N1 in BL
        JMP FINESE
FALSO:  MOV BL, N2 ; Se N1 <= N2, carica N2 in BL
FINESE: NOP ;No operation, non faccio nulla
        MOV AH, 4CH ; Termina il programma
        INT 21H ; Interruzione per terminare il programma
END