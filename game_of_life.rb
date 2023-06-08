class GameOfLife
    def initialize(rows, cols)
        @rows = rows
        @cols = cols
        @board = generate_board
    end

    def generate_board()
        tablero = Array.new(@rows){Array.new(@cols, 0)}
    end

    def imprimir_tablero
        @board.each do |rows| 
            puts rows.join(" ")
        end
    end

    #def next_generation()
     #   new_board = Array.new(@rows){Array.new(@cols, 1)}

    #end

end

tablero = GameOfLife.new(5, 5)
tablero.imprimir_tablero

# Este es el código para ver los vecinos vivosdef explore(grid, r, c, columns, rows)
  alive = 0;
  # upper row
  if( r-1 >= 0)
    if ( grid[r-1][c] == 1 )
      alive += 1
    end
    if( c-1 >= 0)
      if ( grid[r-1][c-1] == 1 )
        alive += 1
      end
    end
    if(c+1 <= columns)
      if ( grid[r-1][c+1] == 1 )
        alive += 1
      end
    end
  end
  # same row
  if( c-1 >= 0)
    if ( grid[r][c-1] == 1 )
      alive += 1
    end
  end
  if(c+1 <= columns)
    if ( grid[r-1][c+1] == 1 )
      alive += 1
    end
  end
  # lower row
  puts "#{rows} son las rows"
  if( r+1 <= rows)
    if ( grid[r+1][c] == 1 )
      alive += 1
    end
    if( c-1 >= 0)
      if ( grid[r+1][c-1] == 1 )
        alive += 1
      end
    end
    if(c+1 <= columns)
      if ( grid[r+1][c+1] == 1 )
        alive += 1
      end
    end
  end
  return alive
end

for r in 0..2 do
  for c in 0..2 do
    alive = explore(grid, r, c, columns, rows)
    puts "#{r},#{c} tiene #{alive} vivos"
    puts alive
  end
end
