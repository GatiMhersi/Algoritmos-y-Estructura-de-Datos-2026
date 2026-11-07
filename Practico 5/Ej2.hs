import Ej1 

natToInt2 :: Nat -> Int
natToInt2 Zero = 0
natToInt2 (Succ n) = 1 + natToInt2 n
--natToInt2 (n) = 1 + natToInt(n - 1) No se puede, porque haskell no sabe restar 


