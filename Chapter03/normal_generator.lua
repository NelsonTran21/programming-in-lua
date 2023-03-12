local function generate_random_number()
   return (
       math.random() +
       math.random() +
       math.random() +
       math.random() +
       math.random() +
       math.random() +
       math.random() +
       math.random() +
       math.random() +
       math.random()
       ) / 10
end

local function graph_random_numbers()
   local buckets = {}

   for _ = 1, 5000000 do
      local x = generate_random_number()
      local bucket = math.floor(x * 50) + 1
      buckets[bucket] = (buckets[bucket] or 0) + 1
   end

   for _, bucket in pairs(buckets) do
      for _ = 1, bucket // 10000 do
         io.write('*')
      end
      if bucket >= 10000 then
         io.write('\n')
      end
   end
end

graph_random_numbers()
