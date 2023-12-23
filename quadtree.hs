data Qtree = Leaf Int |
  Node Qtree Qtree Qtree Qtree deriving (Eq, Show)

allBlack :: Int -> Qtree
allBlack x = Leaf(-1)

allWhite :: Int -> Qtree
allWhite x = Leaf(1)

clockwise :: Qtree -> Qtree -> Qtree -> Qtree -> Qtree
clockwise a b c d = Node a b c d

anticlockwise :: Qtree -> Qtree -> Qtree -> Qtree -> Qtree
anticlockwise a b c d = Node a d c b

empty :: Qtree
empty = Leaf(0)

split :: Qtree -> Qtree
split (Leaf a) = (Node (Leaf a) (Leaf a) (Leaf a) (Leaf a)) 
split (Node a b c d) = (Node a b c d)

getA :: Qtree -> Qtree
getA (Node a b c d) = a

getB :: Qtree -> Qtree
getB (Node a b c d) = b

getC :: Qtree -> Qtree
getC (Node a b c d) = c

getD :: Qtree -> Qtree
getD (Node a b c d) = d 

west :: Qtree -> Int -> Int
west (Leaf a) x = if (a == x) then -1 else if (a == 0) then 0 else 1
west (Node a b c d) x = (west a x + west b x)

north :: Qtree -> Int -> Int
north (Leaf a) x = if (a == x) then -1 else if (a == 0) then 0 else 1
north (Node a b c d) x = (north b x + north c x)

east :: Qtree -> Int -> Int
east (Leaf a) x = if (a == x) then -1 else if (a == 0) then 0 else 1
east (Node a b c d) x = (east c x + east d x)

south :: Qtree -> Int -> Int
south (Leaf a) x = if (a == x) then -1 else if (a == 0) then 0 else 1
south (Node a b c d) x = (south d x + south a x)

checkColor :: Int -> Qtree -> Qtree -> Qtree -> Qtree -> Qtree
checkColor x left top right bot = 
 if (((east left x) + (south top x) + (west right x) + (north bot x)) > 0)
  then Leaf(-1 * x)
  else Leaf(x)

changeColor :: Qtree -> Qtree -> Qtree -> Qtree -> Qtree -> Qtree 
changeColor (Leaf a) left top right bot = 
 checkColor a left top right bot

changeColor (Node a b c d) left top right bot =
 Node (changeColor a (getD (split left)) b d (getB (split bot)))
  (changeColor b (getC (split left)) (getA (split top)) c a) 
  (changeColor c b (getD (split top)) (getB (split right)) d)
  (changeColor d a c (getA (split right)) (getC (split bot)))

blur :: Qtree -> Qtree
blur q = changeColor q empty empty empty empty