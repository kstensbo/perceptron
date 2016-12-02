-----------
-- Data
-----------

xData = [(0.6492, 10.5492), (5.0576, -1.9462), (-5.9590, 7.8897), (2.9614, 1.3547), (3.6815, 1.6019), (5.3024, 3.9243), (1.9835, 2.3669), (-3.4360, 8.0828), (6.1168, 2.3159), (6.2850, -0.4685), (4.4086, 1.3710), (-3.7105, 8.4309), (-2.3741, 6.1648), (0.4221, 8.5627), (-3.5980, 9.2361), (-4.5349, 9.6428), (1.6828, 0.5335), (5.3271, -1.5529), (3.2860, 3.1965), (5.2880, 1.2030), (-3.7126, 12.7188), (-2.5362, 6.8989), (-2.0253, 5.1877), (6.7019, 3.8357), (-2.9775, 8.5460), (2.4272, -0.4192), (3.7186, 4.0874), (-4.3252, 6.1897), (-4.8112, 9.7657), (-3.4481, 10.0994)]

xDataAug = [[1, x, y] | (x,y) <- xData]

yData :: [Double]
yData = [-1, 1, -1, 1, 1, 1, 1, -1, 1, 1, 1, -1, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, 1, -1, 1, 1, -1, -1, -1]

-------------------
-- Vektorregning
-------------------
dotV :: (Num a, Ord a) => [a] -> [a] -> a
dotV x y = sum [i*j | (i,j) <- zip x y]

addV :: (Num a, Ord a) => [a] -> [a] -> [a]
addV x y = [i+j | (i,j) <- zip x y]

scaleV :: (Num a, Ord a) => [a] -> a -> [a]
scaleV x a = [a*i | i <- x]

-----------------
--Klassificering
-----------------
checkClass :: (Num a, Ord a) => [a] -> [a] -> a
checkClass w x
    |(dotV x w) >0 = 1
    |otherwise = -1

checkList :: (Num a, Ord a) => [a] -> [[a]] -> [a] -> Bool
checkList _ [] _ = True
checkList w (x:xs) (y:ys)
    |(checkClass w x)*y == -1 = False
    |otherwise = checkList w xs ys

----------
--Træning
----------
train :: (Num a, Ord a) => [a] -> [a] -> a -> a -> [a]
train w x y eta
    |checkClass w x == y = w
    |otherwise = addV w (scaleV (scaleV x eta) y)


-- ws er en tilfældig normalvektor til en startplan, ws::[Double]
-- xd er den ene halvdel af træningssættet der indeholder features, xd::[[Double]]
-- yd er den anden halvdel af træningssættet der indeholder klasser, yd :: [Double]
-- n er det maksimale antal iterationer algoritmen skal fortage, n :: Int
-- eta er læringsraten, eta :: Double

perceptron :: (Num a, Ord a, Show a) => [a] -> [[a]] -> [a] -> Int -> a -> String
perceptron ws xd yd n eta = trainList ws (cycle xd) (cycle yd) n where
    trainList w (x:xs) (y:ys) m
        | m < 0 = "Max iterations reached at w = " ++ show w
        | checkList w xd yd = "Solution found at iteration " ++ show (n-m) ++ ": w = " ++ show w
        | otherwise = trainList (train w x y eta) xs ys (m-1)

