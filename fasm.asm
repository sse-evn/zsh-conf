format PE console
entry start

section '.data' data readable writeable
    prompt db 'Enter command: ', 0
    command db 256, 0           ; Буфер для команды
    newline db 10, 0            ; Символ новой строки
    msg_error db 'Unknown command', 0

section '.code' code readable executable
start:
    ; Выводим запрос
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, prompt             ; сообщение запроса
    mov edx, 15                 ; длина запроса
    int 0x80                    ; системный вызов

    ; Читаем команду от пользователя
    mov eax, 3                  ; sys_read
    mov ebx, 0                  ; stdin
    mov ecx, command            ; адрес буфера
    mov edx, 256                ; максимальная длина ввода
    int 0x80                    ; системный вызов

    ; Убираем символ новой строки из ввода
    xor eax, eax
remove_newline:
    mov al, byte [command + eax]
    cmp al, 10                  ; проверяем символ новой строки
    je process_command          ; если найден, переходим к обработке команды
    inc eax
    jmp remove_newline

process_command:
    ; Если команда "exit", завершаем программу
    mov al, byte [command]
    cmp al, 'e'                 ; проверяем первую букву
    jne not_exit
    mov al, byte [command + 1]
    cmp al, 'x'
    jne not_exit
    mov al, byte [command + 2]
    cmp al, 'i'
    jne not_exit
    mov al, byte [command + 3]
    cmp al, 't'
    jne not_exit

    ; Завершаем программу
    mov eax, 1                  ; sys_exit
    xor ebx, ebx                ; статус выхода 0
    int 0x80

not_exit:
    ; Если команда "add", выполняем сложение
    mov al, byte [command]
    cmp al, 'a'                 ; проверяем первую букву
    jne not_add
    mov al, byte [command + 1]
    cmp al, 'd'
    jne not_add
    mov al, byte [command + 2]
    cmp al, 'd'
    jne not_add

    ; Выполняем сложение 3 + 4
    mov eax, 3                  ; первый операнд
    mov ebx, 4                  ; второй операнд
    add eax, ebx                ; результат в eax

    ; Выводим результат
    mov edx, eax                ; результат сложения
    call print_result
    jmp start

not_add:
    ; Если команда "error", выводим ошибку
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, msg_error          ; сообщение об ошибке
    mov edx, 16                 ; длина сообщения
    int 0x80                    ; системный вызов

    jmp start

print_result:
    ; Функция для вывода результата
    push eax
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, result_msg         ; сообщение с результатом
    mov edx, 12                 ; длина сообщения
    int 0x80                    ; системный вызов
    pop eax
    ret

section '.data' data readable writeable
    result_msg db 'Result: ', 0
