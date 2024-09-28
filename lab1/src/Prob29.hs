{-
    Выполнение требований:
        - хвостовой рекурсии - Нет
        - рекурсии - Есть
        - модульной реализации - Есть
        - Сверточные функции - Есть
        - генерация последовательности при помощи отображения (map) - Есть
        - работа со спец. синтаксисом для циклов (где применимо) - Есть
        - работа с бесконечными списками для языков - Нет
-}

module Prob29
(
    countDistinctPowers,
    countDistinctPowersRecursive
) where
import Data.List (nub)

--  Функция возвращает список всех возможных степеней, использвуя генерацию списка
generateComprehensionListOfPowers :: Int -> Int -> [Int]
generateComprehensionListOfPowers limitA limitB = [a^b | a <- [2..limitA], b <- [2..limitB]]


--  Функция рекурсивно генерирует список всех возможных комбинаций степеней
generatePowersRecursive :: Int -> Int -> [Int]
generatePowersRecursive limitA limitB = generatePowersRecursive' 2 2
    where
        generatePowersRecursive' a b = 
            if a > limitA || b > limitB then []
            else a^b : generatePowersRecursive' (a+1) b  ++ generatePowersRecursive' a (b+1)


--  Функция возвращает количество уникальных степеней
countDistinctPowers :: Int -> Int -> Int
countDistinctPowers limitA limitB = length $ nub $ generateComprehensionListOfPowers limitA limitB


--  Функция возвращает количество уникальных степеней, используя рекурсию для генерации,
--  Преобразует униклаьные значения в единички с помощью map и суммирует их с помощью foldl(свертка)
countDistinctPowersRecursive :: Int -> Int -> Int
countDistinctPowersRecursive limitA limitB = foldl (+) 0 (map (const 1) (nub $ generatePowersRecursive limitA limitB))
