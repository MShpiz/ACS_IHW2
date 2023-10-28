﻿# ИДЗ по АВС №2
**Вариант:** 31 \
**Выполнила:** Панфилова Мария Денисовна \
**Группа:** БПИ226

## Текст варианта
31. Разработать программу численного интегрирования функции y = a + b * x^3 (задаётся действительными числами а,b) в определённом диапазоне целых (задаётся так же) методом прямоугольников с недостатком (точность вычислений = 0.0001).

## Алгоритм решения задачи

1. Получить от пользователя значения a, b, начало диапазона интегрирования, конец диапазона интегрирования.
2. Если начало диапазона интегрирования больше чем конец диапазона интегрирования, поменять их местами и "запомнить", что произошел обмен, чтобы после завершения интегрирования сменить знак результата.
4. Если b не равно 0 посчитать интеграл прямоугольников с недостатком (методом левых прямоугольников):
    1. Взать длину шага (отрезка на которые делится область под графиком) в два раза меньше чем она была на предыдущей итерации (начальное значение полинтервала)
    2. Посчитать площадь под графиком, как сумму площадей прямоугольников с длинной равной шагу и высотой равной значению функции в левой точке отрезка.
    3. Если текущая сумма отличается от суммы на предыдущем шаге более чем на 0.0001, записать её как новый результат вычислений и продолжить вычисления, иначе завершить вычисление интегралла.
5. Вывести результат вычеслений.

[Источник информации с описанием метода решения задачи](http://www.mathprofi.ru/metod_prjamougolnikov.html)
## Решение на 10



## Решение на 9
- В программу добавлено использование макросов для реализации ввода и вывода данных. [Макросы](https://github.com/MShpiz/ACS_IHW2/blob/master/code/macrolib.s) поддерживают повторное использование с различными параметрами. (Данная задача не подразумевает подключения различных входных и выходных массивов по условию.)

## Решение на 8
- Разработанные подпрограммы поддерживают многократное использование с различными наборами исходных данных. (Данная задача не подразумевает подключения различных входных и выходных массивов по условию.)
- Реализованно автоматизированное тестирование за счет создания дополнительной [тестовой программы](https://github.com/MShpiz/ACS_IHW2/blob/master/code/test.asm), осуществляющей прогон подпрограмм, осуществляющих вычисления для различных тестовых данных (вместо их ввода). Осуществлён прогон тестов обеспечивающих покрытие различных ситуаций, описанных в разделе Тестирование.
- Для дополнительной проверки корректности вычислений осуществлены аналогичные тестовые прогоны с использованием ЯП Python и библиотеки sympy. Результаты прогонов представлены [тут](https://github.com/MShpiz/ACS_IHW2/tree/master/test_results/python).


## Решение на 6-7
- В программе используюется подпрограмма integrate с передачей аргументов через регистры, что обеспечивает их повторное использование с различными входными аргументами. 
- Внутри подпрограммы для тесирования используются локальные переменные сохраняющиеся на стек. В остальных подпрограммах хватает временных регистров для хранения всех данных, поэтому локальные переменные на стек не сохраняются.
- В местах вызова функции добавилены комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата.

## Решение на 4-5 
- Приведено решение задачи на ассемблере в папке (code)[https://github.com/MShpiz/ACS_IHW2/tree/master/code]. Ввод данных осуществляется с клавиатуры. Вывод данных осуществляется на дисплей.
- В программе присутствовуют комментарии, поясняющие выполняемые действия.
- В пункте ниже представлено полное тестовое покрытие.
- Приведены результаты тестовых прогонов в папке [test_results/assembler](https://github.com/MShpiz/ACS_IHW2/tree/master/test_results/assembler), с использованием скриншотов.



## Тестирование
Так как метод вычисления интеграллов левыми прямоугольниками не самый точный, рузльтат выполнения программы может немного отличаться от результата в таблице. Также из-за того что мой алгоритм прекращает вычисления интегралла сразу после того как разница между результатами оказывается меньше чем 0.0001, результат может отличаться от верного после 3 знака после запятой.
Тесты:
| № |a | b | левая граница диапазона | правая граница диапазона |результат (округленный до 3 знака после запятой) |
|--- | --- | --- | ----| ---| --|
|**1**| 10.0 | 10.0 | 0.0 | 0.0|0.000 |
|**2**| 0.0 | 0.0 | 0.0 | 1.0 | 0.000|
|**3**| 10.0 | 0.0 |  0.0 |  1.0 | 10.000|
|**4**| 1.0 | 1.0 | 0.0 | 1.0 |1.250|
|**5**| 1.0 | 1.0 | 1.0 | 0.0 |-1.250|
|**6**| 0.0 | 1.0 | 0.0 | 1.0 |0.250|
|**7**| 0.0 | 1.0 | -1.0 | 0.0 |-0.250|
|**8**| 0.0 | 1.0 | -1.0 | 1.0 |0.000|
|**9**| 100.0 | -150.0 | -0.13 | 0.12 |25.003|
|**10**| 0.0 | 0.00001 | 1000.0 | 1001.0 |10015.010|


