.MODEL SMALL
.STACK 100H
.DATA

.CODE
.STARTUP

    MOV AL, 25

    MOV AH, 02h
    MOV DL, AL ;Output al
    INT 21h

    MOV AH, 4Ch
    INT 21h
END