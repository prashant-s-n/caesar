module Lib (
    lowerAlphabet,
    upperAlphabet,
    digits,
    isLower,
    isUpper,
    isDigit,
    isMisc,
    listLength,
    indexOf,
    getByIndex,
    lowerRot,
    upperRot,
    digitRot,
    rotChar,
    caeser,
    rotate,
    rot135,
    caeser2,
    alphabets,
    count,
    countEach,
) where

-- Type alias for the Alphabet type
type Alphabet = [Char]

lowerAlphabet :: Alphabet
lowerAlphabet = ['a' .. 'z' :: Char]

upperAlphabet :: Alphabet
upperAlphabet = ['A' .. 'Z' :: Char]

digits :: Alphabet
digits = ['0' .. '9']

alphabets :: Alphabet
alphabets = lowerAlphabet ++ upperAlphabet

isLower :: Char -> Bool
isLower char = char `elem` lowerAlphabet

isUpper :: Char -> Bool
isUpper char = char `elem` upperAlphabet

isDigit :: Char -> Bool
isDigit char = char `elem` digits

isMisc :: Char -> Bool
-- isMisc char = not (isLower char || isUpper char || isDigit char)
isMisc char = char `notElem` (lowerAlphabet ++ upperAlphabet ++ digits)

listLength :: [Char] -> Int
listLength [] = 0
listLength (_:xs) = 1 + listLength xs

indexOf :: Char -> Alphabet -> Int
indexOf _ch [] = 0 
indexOf ch (x : xs) = if x == ch then 0 else 1 + indexOf ch xs

getByIndex :: [Char] -> Int -> Char
getByIndex [] _ = undefined -- Base case
getByIndex (x:_) 0 = x
getByIndex (_:xs) n = getByIndex xs (n-1)

alphabetRot :: Alphabet -> Int -> Char -> Char
alphabetRot alphabet offset ch = alphabet !! ((indexOf ch alphabet + offset) `mod` length alphabet)

upperRot :: Int -> Char -> Char
upperRot offset ch = alphabetRot upperAlphabet offset ch

lowerRot :: Int -> Char -> Char
lowerRot offset ch = alphabetRot lowerAlphabet offset ch

digitRot :: Int -> Char -> Char
digitRot offset ch = alphabetRot digits offset ch

rotChar :: Int -> Char -> Char
rotChar offset ch 
    | isLower ch = lowerRot offset ch
    | isUpper ch = upperRot offset ch
    | isDigit ch = digitRot offset ch
    | otherwise = ch


-- caeser :: Int -> String -> String
-- caeser _ [] = []
-- caeser offset (x:xs) = rotChar offset x : caeser offset xs

-- transform _ [] = []
-- transform fun (x:xs) = fun x : transform fun xs

caeser :: Int -> String -> String
caeser offset message = map (\ch -> rotChar offset ch) message

rotate :: Char -> Char
rotate ch
    | isDigit ch = rotChar 5 ch
    | isLower ch = rotChar 13 ch
    | isUpper ch = rotChar 13 ch
    | isMisc ch = ch
    | otherwise = ch

rot135 :: String -> String
rot135 message = map rotate message

caeser2 :: Int -> String -> String
caeser2 offset = map (rotChar offset)

count :: Char -> String -> Int
count ch = length . filter(== ch) 

countEach :: Alphabet -> String -> [(Char, Int)]
countEach alp message =  map (\a -> (a, (count a message))) alp