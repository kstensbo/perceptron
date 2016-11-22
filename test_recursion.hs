x = [0..9]
xs = cycle x

syv2 :: [Integer] -> Integer
syv2 (x:xs)
    | x == 7 = 7
    | otherwise = syv2 xs

syv :: [Integer] -> Integer
syv (x:xs) = if x == 7
               then 7
               else syv xs


kippers :: Integer -> Integer -> Integer
kippers x w = w + x

selleri :: [Integer] -> Integer -> Integer -> (Integer, Integer)
selleri _ w 0 = (w, 0)
selleri (x:xs) w n
    | kippers x w > 100 = (kippers x w, n)
    | otherwise = selleri xs (kippers x w) (n-1)


-- sumLow' = sumLow 0
--     where sumLow n xs
--         |sum (take n xs)>100 = (sum (take n xs), n)
--         |otherwise = sumLow (n+1) xs


