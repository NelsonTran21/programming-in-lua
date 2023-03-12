local function compute_cone_volume(h, theta)
   return (math.pi * (h ^ 3) / 3) * math.tan(theta) ^ 2
end

local h = 2
local theta = math.pi / 6

print('h = ' .. h)
print('θ = ' .. theta)
print('V = ' .. compute_cone_volume(h, theta))
