N = 8           -- Board size.
CHECK_COUNT = 0 -- Number of checks.

local function is_place_ok(board, row, col)
   CHECK_COUNT = CHECK_COUNT + 1
   for i = 1, row - 1 do
      if (board[i] == col) or              -- Same column?
          (board[i] - i == col - row) or   -- Same diagonal?
          (board[i] + i == col + row) then -- Same diagonal?
         return false
      end
   end
   -- Nothing is attacking the queen.
   return true
end

local function print_solution(board)
   for row = 1, N do
      for col = 1, N do
         io.write(board[row] == col and '♛' or '·', ' ')
      end
      io.write('\n')
   end
   io.write('\n')
end

local function add_queen(board, row)
   if row > N then
      -- All queens have been placed.
      print_solution(board)
   else
      for col = 1, N do
         -- Prune the search space.
         if is_place_ok(board, row, col) then
            board[row] = col          -- Place the queen.
            add_queen(board, row + 1) -- Try to place the next queen.
         end
      end
      -- Pop the stack frame and backtrack.
   end
end

local function add_queen_one_solution(board, row)
   if row > N then
      -- All queens have been placed.
      print_solution(board)

      -- Found a solution.
      return true
   else
      for col = 1, N do
         -- Prune the search space.
         if is_place_ok(board, row, col) then
            board[row] = col                                      -- Place the queen.
            local solved = add_queen_one_solution(board, row + 1) -- Try to place the next queen.

            -- If solution is found, pop the stack frame without backtracking.
            if solved then return solved end
         end
      end
      -- Pop the stack frame and backtrack.
   end

   -- No solution found.
   return false
end

local function add_queen_bruteforce(board, row)
   for col = 1, N do
      -- Place the queen.
      board[row] = col

      -- Check if permutation is valid.
      if row == N then
         local is_valid = true

         for i = 1, N do
            local j = board[i]
            if not is_place_ok(board, i, j) then
               is_valid = false
               break
            end
         end

         if is_valid then
            print_solution(board)
         end
      else
         -- Place the next queen.
         add_queen_bruteforce(board, row + 1)
      end
   end
end

CHECK_COUNT = 0
print('add_queen({}, 1)\n')
add_queen({}, 1)
print('CHECK_COUNT = ' .. CHECK_COUNT .. '\n')

print('═══════════════════════════════════\n')

CHECK_COUNT = 0
print('add_queen_one_solution({}, 1)\n')
add_queen_one_solution({}, 1)
print('CHECK_COUNT = ' .. CHECK_COUNT .. '\n')

print('═══════════════════════════════════\n')

CHECK_COUNT = 0
print('add_queen_bruteforce({}, 1)\n')
add_queen_bruteforce({}, 1)
print('CHECK_COUNT = ' .. CHECK_COUNT .. '\n')
