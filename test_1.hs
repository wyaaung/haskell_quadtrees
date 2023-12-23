
-- This file is used to test
-- More testing examples will be provided on Blackboard
-- It needs to be pasted, which is what the script test.sh does
-- before compiling and running

-- testing 1

t1a = clockwise (allBlack 1) (allBlack 1) (allWhite 1) (allWhite 1) == anticlockwise (allBlack 1) (allWhite 1) (allWhite 1) (allBlack 1)

t1b = clockwise (allBlack 2) (anticlockwise (allBlack 1) (allWhite 1) (allWhite 1) (allBlack 1)) (allWhite 2) (allWhite 2) == anticlockwise (allBlack 2) (allWhite 2) (allWhite 2) (clockwise (allBlack 1) (allBlack 1) (allWhite 1) (allWhite 1))

t1c = clockwise (allBlack 1) (allBlack 1) (allWhite 1) (allWhite 1) /= anticlockwise (allWhite 1) (allWhite 1) (allWhite 1) (allBlack 1)

mainS = putStrLn("-------------------- Tests running... --------------------")
        >> putStrLn(if t1a then "1:\t Simple check for ex 1 passed!" else "ERROR: Simple check for ex1 FAILED!")
        >> putStrLn(if t1c then "2:\t Inequality check for ex 1 passed!" else "ERROR: Inequality check for ex1 FAILED!")
        >> putStrLn(if t1b then "3:\t Larger check for ex 1 passed!" else "ERROR: Larger check for ex1 FAILED!")
--
