.text
.globl main

main:
    # Ввод x
    li a7, 5
    ecall
    mv t0, a0

    li t1, 126          # Номер группы
    li t2, 16           # Шаг

    # t0 = минимум, t1 = максимум
    ble t0, t1, loop
    mv t3, t0
    mv t0, t1
    mv t1, t3

loop:
    # Вывод текущего числа
    mv a0, t0
    li a7, 1
    ecall

    # Перевод строки
    li a0, 10
    li a7, 11
    ecall

    # Если до конца меньше шага, завершаем
    # Вычитание и сравнение без знака избегают переполнения
    sub t3, t1, t0
    bltu t3, t2, finish

    add t0, t0, t2
    j loop

finish:
    li a7, 10
    ecall