module Main (main) where

import Lib

main :: IO ()
main = do
    putStrLn "Running Caesar Cipher Tests..."
    
    testLowerAlphabet
    testUpperAlphabet
    testDigits
    testIsLower
    testIsUpper
    testIsDigit
    testIsMisc
    testCaesarLower
    testCaesarUpper
    testCaesarDigits
    testCaesarMixed
    
    putStrLn "All tests passed!"

testEq :: String -> Bool -> IO ()
testEq name True = putStrLn $ "  [PASS] " ++ name
testEq name False = putStrLn $ "  [FAIL] " ++ name >> error "Test failed"

testLowerAlphabet :: IO ()
testLowerAlphabet = testEq "lowerAlphabet" $ lowerAlphabet == "abcdefghijklmnopqrstuvwxyz"

testUpperAlphabet :: IO ()
testUpperAlphabet = testEq "upperAlphabet" $ upperAlphabet == "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

testDigits :: IO ()
testDigits = testEq "digits" $ digits == "0123456789"

testIsLower :: IO ()
testIsLower = do
    testEq "isLower 'a'" $ isLower 'a'
    testEq "isLower 'z'" $ isLower 'z'
    testEq "isLower 'A'" $ not (isLower 'A')
    testEq "isLower '1'" $ not (isLower '1')

testIsUpper :: IO ()
testIsUpper = do
    testEq "isUpper 'A'" $ isUpper 'A'
    testEq "isUpper 'Z'" $ isUpper 'Z'
    testEq "isUpper 'a'" $ not (isUpper 'a')
    testEq "isUpper '1'" $ not (isUpper '1')

testIsDigit :: IO ()
testIsDigit = do
    testEq "isDigit '0'" $ isDigit '0'
    testEq "isDigit '9'" $ isDigit '9'
    testEq "isDigit 'a'" $ not (isDigit 'a')
    testEq "isDigit 'A'" $ not (isDigit 'A')

testIsMisc :: IO ()
testIsMisc = do
    testEq "isMisc ' '" $ isMisc ' '
    testEq "isMisc '!'" $ isMisc '!'
    testEq "isMisc 'a'" $ not (isMisc 'a')
    testEq "isMisc 'A'" $ not (isMisc 'A')

testCaesarLower :: IO ()
testCaesarLower = do
    testEq "caeser 0 \"abc\"" $ caeser 0 "abc" == "abc"
    testEq "caeser 1 \"abc\"" $ caeser 1 "abc" == "bcd"
    testEq "caeser 3 \"hello\"" $ caeser 3 "hello" == "khoor"
    testEq "caeser 13 \"hello\"" $ caeser 13 "hello" == "uryyb"
    testEq "caeser (-3) \"khoor\"" $ caeser (-3) "khoor" == "hello"

testCaesarUpper :: IO ()
testCaesarUpper = do
    testEq "caeser 1 \"ABC\"" $ caeser 1 "ABC" == "BCD"
    testEq "caeser 3 \"HELLO\"" $ caeser 3 "HELLO" == "KHOOR"
    testEq "caeser 13 \"ABC\"" $ caeser 13 "ABC" == "NOP"

testCaesarDigits :: IO ()
testCaesarDigits = do
    testEq "caeser 1 \"012\"" $ caeser 1 "012" == "123"
    testEq "caeser 5 \"012\"" $ caeser 5 "012" == "567"
    testEq "caeser 1 \"789\"" $ caeser 1 "789" == "890"

testCaesarMixed :: IO ()
testCaesarMixed = do
    testEq "caeser 1 \"aB1\"" $ caeser 1 "aB1" == "bC2"
    testEq "caeser 3 \"Hello123\"" $ caeser 3 "Hello123" == "Khoor456"
    testEq "caeser 0 \"Hello World!\"" $ caeser 0 "Hello World!" == "Hello World!"