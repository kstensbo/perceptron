import qualified Data.Blobs as Blobs
import qualified Data.Circles as Circles
import qualified Data.Classification as Classification
import qualified Data.Moons as Moons

phi x = [[1,x1,x2,x1^2,x2^2]|[1,x1,x2]<-x]


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

accuracy _ [] _ = []
accuracy w (x:xs) (y:ys)
    |(checkClass w x)*y == -1 = accuracy w xs ys
    |otherwise = 1: accuracy w xs ys


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
        | m < 0 = "Max iterations reached at w = " ++ show w ++ " , accuracy = " ++ show (sum (accuracy w xd yd)) ++ "/" ++ show (length xd)

        | checkList w xd yd = "Solution found at iteration " ++ show (n-m) ++ ": w = " ++ show w
        | otherwise = trainList (train w x y eta) xs ys (m-1)


--phi er Feature Space, phi :: ([a]->[a])
--f.eks. (\[1,x1,x2]->[1,x1,x2]) eller (\x->x)
--       (\[1,x1,x2]->[1,x1^2,x2^2])
--       (\[1,x1,x2]->[1,x1,x2,x1*x2])
--       (\[1,x1,x2]->[1,x1,x2,x1^2,x2^2])

perceptronFS :: (Num a, Ord a, Show a) => [a] -> [[a]] -> [a] -> Int -> a ->([a]->[a])->String
perceptronFS ws xd yd n eta phi = trainList ws (cycle $ map phi xd) (cycle yd) n where
    trainList w (x:xs) (y:ys) m
        | m < 0 = "Max iterations reached at w = " ++ show w ++ " , accuracy = " ++ show (sum (accuracy w (map phi xd) yd)) ++ "/" ++ show (length xd)
        | checkList w (map phi xd) yd = "Solution found at iteration " ++ show (n-m) ++ ": w = " ++ show w
        | otherwise = trainList (train w x y eta) xs ys (m-1)



perceptronBS :: (Num a, Ord a, Show a) => [a] -> [[a]] -> [a] -> Int -> a ->([a]->[a])->String
perceptronBS ws xd yd n eta phi = trainList ws (cycle featureX) (cycle yd) n ws
    where featureX = map phi xd
          trainList w (x:xs) (y:ys) m bs
            | m < 0 = "Max iterations reached at w = " ++ show w ++ " , accuracy = " ++ show (sum (accuracy w featureX yd)) ++ "/" ++ show (length xd) ++ " , best so far:" ++ show (bs, (sum $ accuracy bs featureX yd) / fromIntegral (length xd))
            | checkList w featureX yd = "Solution found at iteration " ++ show (n-m) ++ ": w = " ++ show w
            | otherwise = trainList (train w x y eta) xs ys (m-1) (if accuracy w featureX yd > accuracy bs featureX yd then w else bs)


