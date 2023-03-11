# Chapter 2

## Exercise 2.1

> Modify the eight-queen program so that it stops after printing the first solution.

See `eight_queens.lua`. Cloned the `add_queen` -> `add_queen_one_solution` and updated the function to return a boolean value indicating if a solution is found to use as a signal to skip backtracking.

## Exercise 2.2

> An alternative implementation for the eight-queen problem would be to generate all possible permutations of 1 to 8 and, for each permutation, to check whether it is valid. Change the program to use this approach. How does the performance of the new program compare with the old one? (Hint: compare the total number of permutations with the number of times that the original program calls the function `is_place_ok`.)

The bruteforce approach is significantly less performant (3-orders of magnitude for N = 8) than the backtracking approach.

### Benchmark

```bash
lua eight_queens.lua | rg '^(CHECK_COUNT|add_queen)'
```

### Output

```
add_queen({}, 1)
CHECK_COUNT = 15720
add_queen_one_solution({}, 1)
CHECK_COUNT = 876
add_queen_bruteforce({}, 1)
CHECK_COUNT = 50889536
```
