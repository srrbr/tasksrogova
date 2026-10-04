.text
.globl main

main:
    # Ввод целого числа x
    li a7, 5
    ecall

    # Сравнение с номером студента
    li t0, 16
    beq a0, t0, equal

    li a0, 0
    j print_result

equal:
    li a0, 1

print_result:
    # Вывод результата
    li a7, 1
    ecall

    # Завершение программы
    li a7, 10
    ecall