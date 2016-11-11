-----------------------
--Hello recursion!
-----------------------

--Home-made maximum if/else
maximumIf :: (Ord a)=>[a]->a
maximumIf [] = error "maximum of empty list"
maximumIf [x] = x
maximumIf (x:xs) = if x>maxTail then x else maxTail
	where maxTail= maximum' xs


--Home-made maxumim guards
maximumG :: (Ord a)=>[a]->a
maximumG [] = error "maximum of empty list"
maximumG [x] = x
maximumG (x:xs)
	| x > maxTail = x
	|otherwise = maxTail
	where maxTail= maximum'' xs


--Home-made maximum max

Er det her Haskell?

maximum' :: (Ord a)=> [a]->a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
