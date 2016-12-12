import Data
-----------
-- Data
-----------
-- xBlobs' = [(0.6492, 10.5492), (5.0576, -1.9462), (-5.9590, 7.8897), (2.9614, 1.3547), (3.6815, 1.6019), (5.3024, 3.9243), (1.9835, 2.3669), (-3.4360, 8.0828), (6.1168, 2.3159), (6.2850, -0.4685), (4.4086, 1.3710), (-3.7105, 8.4309), (-2.3741, 6.1648), (0.4221, 8.5627), (-3.5980, 9.2361), (-4.5349, 9.6428), (1.6828, 0.5335), (5.3271, -1.5529), (3.2860, 3.1965), (5.2880, 1.2030), (-3.7126, 12.7188), (-2.5362, 6.8989), (-2.0253, 5.1877), (6.7019, 3.8357), (-2.9775, 8.5460), (2.4272, -0.4192), (3.7186, 4.0874), (-4.3252, 6.1897), (-4.8112, 9.7657), (-3.4481, 10.0994)]
-- xBlobs = [[1, x1, x2]| (x1, x2) <- xBlobs']
--
--
-- yBlobs :: [Double]
-- yBlobs = [-1, 1, -1, 1, 1, 1, 1, -1, 1, 1, 1, -1, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, 1, -1, 1, 1, -1, -1, -1]
--
--
-- xCircles' = [(-0.1507, -0.4284), (0.4195, 0.2776), (-0.3024, 0.2948), (0.7194, -0.5990), (0.8759, -0.7969), (0.2824, -0.8096), (-0.8840, 0.1997), (-0.2909, -0.2432), (0.3558, 1.0247), (0.9220, -0.0844), (-0.6525, 0.6740), (-0.7940, -0.5991), (-0.1241, -0.0030), (-0.6140, -0.8019), (0.2109, -0.1517), (1.0386, 0.5641), (-0.3675, 0.0395), (-0.4485, -0.1311), (-0.0855, 0.9751), (-0.6327, -0.7055), (0.2462, 0.1991), (0.0975, -0.4248), (-0.9071, -0.2565), (0.4488, -0.8950), (-0.4226, 0.5682), (-0.4186, 1.0425), (0.2424, -1.0024), (0.3807, -0.3386), (0.3595, 0.8902), (-0.4565, 0.0650), (0.2961, 1.0828), (0.8856, -0.3765), (0.0001, -0.5231), (-0.8960, -0.1707), (0.4515, -0.5022), (0.7328, 0.6047), (-0.3025, 0.2951), (-0.1373, 0.5206), (-0.3136, -0.9294), (-0.3745, 0.9592), (0.9949, -0.2450), (-0.3468, -0.8617), (0.5277, 0.7023), (0.4124, -0.1746), (-1.0406, -0.2757), (-0.7433, 0.7462), (-0.1667, -0.2673), (-0.8831, 0.0873), (0.0457, 0.2549), (-0.1656, 1.0722), (-1.1632, 0.1372), (1.0298, 0.3834), (-0.5960, 0.7597), (0.1444, -0.9509), (0.5073, 0.9509), (-0.2865, 0.0316), (0.7857, 0.6681), (-0.0893, 0.1995), (-0.1723, -0.9839), (-0.0581, -0.3954), (0.4259, 0.2004), (0.3009, 0.0604), (0.4139, 0.4988), (0.5056, -0.6985), (0.4316, 0.0059), (-0.1233, 0.3348), (0.6827, -0.5665), (-0.1185, 0.4254), (0.0376, 0.4433), (0.6503, -0.1504), (-0.3517, -0.1736), (0.4865, -0.9397), (0.2749, 0.1433), (1.0022, -0.2436), (0.3657, -0.1470), (0.1940, 0.2269), (-0.6318, -0.0268), (-0.5278, -0.8041), (0.3551, -0.3818), (0.0397, 0.2869), (-0.1277, 0.2809), (-0.1253, -0.1840), (-0.1295, -1.1672), (-0.8106, -0.6253), (0.8738, 0.1748), (0.3709, 0.0308), (-0.8695, 0.4408), (1.1575, 0.1811), (-1.0599, 0.2032), (-0.0664, -0.3396), (-0.0288, -0.3193), (-0.4510, 0.1278), (-0.0797, -0.3410), (-0.2941, -0.2644), (-0.6426, 0.5139), (0.1129, 0.3318), (-0.1912, 0.1493), (-0.2607, 0.9245), (0.2008, -0.4171), (0.3600, 0.0659)]
-- xCircles = [[1, x1, x2] | (x1, x2) <- xCircles']
--
-- yCircles :: [Double]
-- yCircles = [1, 1, 1, -1, -1, -1, -1, 1, -1, -1, -1, -1, 1, -1, 1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1, -1, -1, 1, -1, 1, -1, -1, 1, -1, 1, -1, 1, 1, -1, -1, -1, -1, -1, 1, -1, -1, 1, -1, 1, -1, -1, -1, -1, -1, -1, 1, -1, 1, -1, 1, 1, 1, 1, -1, 1, 1, -1, 1, 1, 1, 1, -1, 1, -1, 1, 1, 1, -1, 1, 1, 1, 1, -1, -1, -1, 1, -1, -1, -1, 1, 1, 1, 1, 1, -1, 1, 1, -1, 1, 1]

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



