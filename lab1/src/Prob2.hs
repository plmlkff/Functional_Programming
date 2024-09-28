{-
    Выполнение требований:
        - хвостовой рекурсии - Есть
        - рекурсии - Есть
        - модульной реализации - Есть
        - Сверточные функции - Есть
        - генерация последовательности при помощи отображения (map) - Есть
        - работа со спец. синтаксисом для циклов (где применимо) - Есть
        - работа с бесконечными списками для языков - Есть
-}

module Prob2 
(
    countEvenNumbers,
    countEvenNumbersTail
) where

--  Функция для рекурсивного подсчета числа Фибоначчи по порядковому номеру
fibRecursion :: Int -> Int
fibRecursion 1 = 1
fibRecursion 2 = 2
fibRecursion n = fibRecursion(n-1) + fibRecursion(n-2)

--  Функция для рекурсивной генерации чисел по порядку и подсчета четных чисел Фибоначчи, не превышающих n
countEvenNumbers :: Int -> Int
countEvenNumbers limit = countEvenNumbers' limit 1
    where
        countEvenNumbers' limit i = 
            let fib = fibRecursion i
            in if fib  >= limit
                then 0
                else (if even fib then 1 else 0) + countEvenNumbers' limit (i+1)

--  Функция для вычисления числа фибоначчи по порядковому номеру на основе хвостовой рекурсии
fibTailRecursion :: Int -> Int
fibTailRecursion n = fibTailRecursion' 0 1 n
    where
        fibTailRecursion' a _ 0 = a
        fibTailRecursion' a b n = fibTailRecursion' b (a+b) (n-1)


--  Функция в цикле(спец синтаксис takeWhile) работает с бесконечным списком и преобразует его в числа фибоначчи с помощью map,
--  а затем фильтрует полученные значения (свертывает) чтобы они были четными, возвращая длину отфильтрованного списка  
countEvenNumbersTail :: Int -> Int
countEvenNumbersTail limit = length $ filter even (takeWhile (< limit) (map fibTailRecursion [1..]))