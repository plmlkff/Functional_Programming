{-
    Выполнение требований:
        - хвостовой рекурсии - Есть
        - рекурсии - Слишком накладно по времени выполнения, только хвостовая
        - модульной реализации - Есть
        - Сверточные функции - Есть
        - генерация последовательности при помощи отображения (map) - Есть
        - работа со спец. синтаксисом для циклов (где применимо) - Есть
        - работа с бесконечными списками для языков - Нет
-}

module Prob29
(
    countDistinctPowers,
    countDistinctPowersTailRecursive
) where
import Data.List (nub)

--  Функция возвращает список всех возможных степеней, использвуя генерацию списка
generateComprehensionListOfPowers :: Int -> Int -> [Int]
generateComprehensionListOfPowers limitA limitB = [a^b | a <- [2..limitA], b <- [2..limitB]]

--  Функция хвостовой рекурсией генерирует список всех возможных комбинаций степеней
generatePowersTailRecursive :: Int -> Int -> [Int]
generatePowersTailRecursive limitA limitB = generatePowersRecursive' 2 2 []
    where
        generatePowersRecursive' a b res
            | a == limitA && b == limitB = a^b : res --  Если мы достигли последнего значения
            | a <= limitA && b > limitB = generatePowersRecursive' (a+1) 2 res --  Если b переполнилось
            | otherwise = generatePowersRecursive' a (b+1) (a^b : res) --  В остальных случаях


--  Функция возвращает количество уникальных степеней
countDistinctPowers :: Int -> Int -> Int
countDistinctPowers limitA limitB = length $ nub $ generateComprehensionListOfPowers limitA limitB

plus :: Int -> Int -> Int
plus a b = a + b

--  Функция возвращает количество уникальных степеней, используя хвостовую рекурсию для генерации,
--  Преобразует униклаьные значения в единички с помощью map и суммирует их с помощью foldl(свертка)
countDistinctPowersTailRecursive :: Int -> Int -> Int
countDistinctPowersTailRecursive limitA limitB = foldl plus 0 (map (const 1) (nub $ generatePowersTailRecursive limitA limitB))
