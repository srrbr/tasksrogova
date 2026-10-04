.data
.align 2
array: .space 128       # 32 числа по 4 байта

.text
.globl main

main:
    la t0, array       # Адрес следующего элемента
    li t1, 0           # Количество записанных чисел
    li t2, 32          # Вместимость массива

read_loop:
    beq t1, t2, finish

    # Ввод целого числа
    li a7, 5
    ecall

    # Ноль завершает ввод
    beq a0, zero, finish

    # Запись числа в массив
    sw a0, 0(t0)
    addi t0, t0, 4
    addi t1, t1, 1
    j read_loop

finish:
    li a7, 10
    ecall