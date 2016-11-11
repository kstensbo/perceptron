-----------------------
--Hello recursion!
-----------------------

--Homemade maximum if/else
maximumIf :: (Ord a)=>[a]->a
maximumIf [] = error "maximum of empty list"
maximumIf [x] = x
maximumIf (x:xs) = if x>maxTail then x else maxTail
	where maxTail= maximum' xs


--Homemade maxumim guards
maximumG :: (Ord a)=>[a]->a
maximumG [] = error "maximum of empty list"
maximumG [x] = x
maximumG (x:xs)
	| x > maxTail = x
	|otherwise = maxTail
	where maxTail= maximum' xs


--Homemade maximum max

maximum' :: (Ord a)=> [a]->a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)



--SayMe modified (using guards and 'where')
sayMe' :: Int -> String
sayMe' x
	|x<0 = "Say no to negativity"
	|x<=(length sayNumbers - 1) = sayNumbers !! x
	|otherwise = "Woah, stop, that one is too big! I can only count so many"
	where sayNumbers = ["zero!","one!","two!","three!","four!","five!"]

-- This error occurs only with 6 as far as i know. Why?
-- ghci>sayMe' 6
-- "*** Exception: Prelude.!!: index too large
