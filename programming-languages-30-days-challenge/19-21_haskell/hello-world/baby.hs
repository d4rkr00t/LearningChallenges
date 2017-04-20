doubleMe x =
    x + x

doubleUs x y =
    doubleMe x + doubleMe y

doubleIfSmall x =
    if x > 100
    then x
    else x * 2

lostNumbers :: [Int]
lostNumbers = [4, 8, 15, 16, 23, 42]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x ]

length' xs = sum [ 1 | _ <- xs]

removeNonUppercase :: String -> String
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

factorial' :: (Integral a) => a -> a
factorial' 0 = 1
factorial' n = n * factorial' (n - 1)

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

length'' :: (Num b) => [a] -> b
length'' [] = 0
length'' (_:xs) = 1 + length'' xs

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:_) = "The first letter of " ++ all ++ " is " ++ [x]
