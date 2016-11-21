x = [0..9]

syv (x:xs)
    | x == 7 = 7
    | otherwise syv xs

