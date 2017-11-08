sayHello :: String -> IO ()
sayHello x =
  putStrLn ("Hello, " ++ x ++ "!")

tripleSqr x = x * x * 3

circleArea r = pi * (r ^ 2) -- \r -> pi * r ^ 2
