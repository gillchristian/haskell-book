module Learn where

printInc n = print plusTwo
  where
    plusTwo = n + 2

printInc2 n =
  let plusTwo = n + 2
  in print plusTwo

----------------------------------------
-- let x = 5; y = 6 in x * y
mult1 = x * y
  where
    x = 5
    y = 6

-- let x = 3; y = 1000 in x * 3 + y
mult2 = x * 3 + y
  where
    x = 3
    y = 1000

-- let y = 10; x = 10 * 5 + y in x * 5
mult3 = x * 5
  where
    x = 10 * 5 + y
    y = 10

-- let x = 7; y = negate x; z = y * 10 in z / x + y
-- let x = 7
--     y = negate x
--     z = y * 10
-- in z / x + y
mult4 = z / x + y
  where
    x = 7
    y = negate x
    z = y * 10

----------------------------------------
{-

2 + 2 * 3 - 3

2 + (2 * 3) - 3

--

2 + 2 * 3 - 1

2 + (2 * 3) - 1

--

(^) 10 $ 1 + 1

10 ^ (1 + 2)

--

2 ^ 2 * 4 ^ 5 + 1

((2 ^ 2) * (4 ^ 5)) + 1

--}
----------------------------------------
-- z = 7
-- y = z + 8
-- x = y ^ 2
-- waxOn = x * 5
waxOn = x * 5
  where
    x = y ^ 2
    y = z + 8
    z = 7

triple x = x * 3

waxOff = triple
