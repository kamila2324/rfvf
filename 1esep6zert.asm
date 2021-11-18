include\masm32\include\macro1.inc
n=8
 .data
 w db 6 dup(?)
   db 0
 MsgBoxCaption db "Жауабы" , 0
 p db 2, 6, 3, 10, 7, -9, 1, 12
 .code
start:
     mov ecx, n-1
     mov ebx, 1
     mov al,  p
     mov di, 0
m1: mov dl, p[ebx]
    cmp dl, 3
    jae m2
    cmp dl, 10
    jbe m2
    cmp dl, al
    jge m2
    mov al, dl
m2: inc ebx
    loop m1
    cbw
    NSTOC w
    invoke MessageBox, NULL, addr w, addr MsgBoxCaption, MB_OK
    mov ax, di
    cbw
    NSTOC w
    invoke MessageBox, NULL, addr w, addr MsgBoxCaption, MB_OK
    invoke ExitProcess, NULL
    end start