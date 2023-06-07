
rows = 3
columns = 3

# Create an empty grid
grid = Array.new(rows,0) { Array.new(columns,0) }

# Accessing and updating grid elements
# grid[0][0] = 1
# grid[0][1] = 0
grid[0][2] = 1
grid[1][0] = 1
# grid[1][1] = 0
# grid[1][2] = 0
# grid[2][0] = 0
grid[2][1] = 1
# grid[2][2] = 0

# # Display the grid
grid.each do |row|
  puts row.join(" ")
end
