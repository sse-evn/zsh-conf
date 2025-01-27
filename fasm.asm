format PE console
entry start

section '.data' data readable writeable
    msg db 'hi', 0

section '.code' code readable executable
start:
    ; Выводим сообщение
    mov eax, 4          ; syscall для вывода на экран
    mov ebx, 1          ; файловый дескриптор stdout
    mov ecx, msg        ; указатель на строку
    mov edx, 19         ; длина строки
    int 0x80            ; системный вызов

    ; Завершаем программу
    mov eax, 1          ; syscall для выхода
    xor ebx, ebx        ; статус выхода 0
    int 0x80            ; системный вызов
