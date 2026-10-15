productoEscalar :: Num a => (a, a) -> (a, a) -> a
productoEscalar a b = (fst a * fst b) + (snd a * snd b)