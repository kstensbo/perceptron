xData :: [(Float,Float)]
xData = [(0.6492, 10.5492), (5.0576, -1.9462), (-5.9590, 7.8897), (2.9614, 1.3547), (3.6815, 1.6019), (5.3024, 3.9243), (1.9835, 2.3669), (-3.4360, 8.0828), (6.1168, 2.3159), (6.2850, -0.4685), (4.4086, 1.3710), (-3.7105, 8.4309), (-2.3741, 6.1648), (0.4221, 8.5627), (-3.5980, 9.2361), (-4.5349, 9.6428), (1.6828, 0.5335), (5.3271, -1.5529), (3.2860, 3.1965), (5.2880, 1.2030), (-3.7126, 12.7188), (-2.5362, 6.8989), (-2.0253, 5.1877), (6.7019, 3.8357), (-2.9775, 8.5460), (2.4272, -0.4192), (3.7186, 4.0874), (-4.3252, 6.1897), (-4.8112, 9.7657), (-3.4481, 10.0994)]
yData :: [Float]
yData = [-1, 1, -1, 1, 1, 1, 1, -1, 1, 1, 1, -1, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, 1, -1, 1, 1, -1, -1, -1]

xyData = zip xData yData

infiniteData :: [a]->[a]
infiniteData xs = xs ++ infiniteData xs

scaleV :: Float -> (Float,Float)->(Float,Float)
scaleV a (x1,x2) = (a*x1,a*x2)

addV :: (Float,Float)->(Float,Float)->(Float,Float)
addV (x1,x2) (y1,y2) = (x1+y1,x2+y2)

weight 0 _ _ = (1,0)
weight k ys xs = addV (weight (k-1) ys xs) deltaw
	where deltaw = scaleV ((infiniteData xs) !! (k-1)) ((infiniteData ys) !! (k-1)) 

prikV (x1,x2) (y1,y2) = (x1*y1)+(x2*y2)

listW= [weight k|k<-[0..]]

checkW [] = True 
checkW (x:xs) z = if prik z x >0 then checkW xs z else False

perceptron head [w|w<-listW,checkW xData w=True]




