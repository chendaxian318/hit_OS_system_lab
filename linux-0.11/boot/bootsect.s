entry _start
_start:
! 首先读入光标位置
    mov ah,#0x03
    xor bh,bh
    int 0x10
! 显示字符串 "welcome come in chendaxian318's OS"
! 要显示的字符串长度
    mov cx,#40
    mov bx,#0x0007
    mov bp,#msg1
! es:bp 是现实字符串的地址
! 相比于linux-0.11中的代码，需要增加对es的处理，因为原代码中在输出之前已经处理了es
    mov ax,#0x07c0
    mov es,ax
    mov ax,#0x1301
    int 0x10
! 设置一个无限循环
inf_loop:
    jmp inf_loop
! msg1 处放置字符串
msg1:
! 回车 + 换行
    .byte   13,10
    .ascii  "welcome come in chendaxian318's OS"
! 两次回车 + 换行
    .byte   13,10,13,10

! boot_flag 必须在最后两个字节
.org 510
! 设置引导扇区标记 0xAA55
! 必须有它，才能引导
boot_flag:
    .word   0xAA55
