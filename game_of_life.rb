class GameOfLife

  attr_reader :rows, :cols, :board

  def initialize(rows, cols)
      @rows = rows
      @cols = cols
      @board = Array.new(@rows){Array.new(@cols, 0)}
  end

  def imprimir_tablero
      @board.each do |rows| 
          puts rows.join(" ")
      end
  end
end

# Este es el código para ver los vecinos vivosdef explore(grid, r, c, columns, rows)
def comparison(grid, row, col)
  if grid[row][col] == 1
    return 1
  else
    return 0
  end
end

def explore(grid, row, col, columns)
  alive = 0;
  # upper row
  if( row-1 >= 0)
    alive += comparison(grid, row-1, col)
    if( col-1 >= 0)
      alive += comparison(grid, row-1, col-1)
    end
    if(col+1 < columns)
      alive += comparison(grid, row-1, col+1)
    end
  end
  # same row
  if( col-1 >= 0)
    alive += comparison(grid, row, col-1)
  end
  if(col+1 < columns)
    alive += comparison(grid, row, col+1)
  end
  # lower row
  if( row+1 < grid.length)
    alive += comparison(grid, row+1, col)
    if( col-1 >= 0)
      alive += comparison(grid, row+1, col-1)
    end
    if(col+1 < columns)
      alive += comparison(grid, row+1, col+1)
    end
  end
  return alive
end

def updateGrid (grid, row, col, newBoard, aliveNeighbors)
  if(grid[row][col] == 0)
    if aliveNeighbors == 3
      newBoard[row][col] = 1
      # "---Esta célula ahora está viva---"
    end
  else
    if aliveNeighbors < 2
      newBoard[row][col] = 0
      # "---MUERTE---"
    elsif aliveNeighbors > 3
      newBoard[row][col] = 0
      # "---MUERTE---"
    elsif aliveNeighbors == 2 or aliveNeighbors == 3
      newBoard[row][col] = 1
      # "---SOBREVIVE---"
    end
  end
end

board = GameOfLife.new(3, 5)
board.board[1][1] = 1
board.board[0][1] = 1
board.board[1][4] = 1
board.board[2][4] = 1
board.board[2][2] = 1



puts "\n"


generacion = 6
g = 0

puts "Generación #{g}"
board.imprimir_tablero

while g <= generacion
  board_copia = GameOfLife.new(board.rows, board.cols)
  # 0 - 4
  (0..board.rows-1).each do |r|
    # 0 - 4
    (0..board.cols-1).each do |c|
      # (0,1)
      vivos = explore(board.board, r, c, board.cols)
      # puts "#{r},#{c} tiene valor #{board.board[r][c]} tiene #{vivos} vecinos vivos"
      updateGrid(board.board, r, c, board_copia.board, vivos)
    end
  end

  puts "\n"
  g += 1
  puts "Generación #{g}"
  board_copia.imprimir_tablero

  board = board_copia
end

#Reglas del juego:
# 1.- Cualquier célula viva con menos de dos vecinos vivos muere,
# como si fuera por falta de población.
# 2.- Cualquier célula viva con más de tres vecinos vivos muere,
#como si fuera por sobre-población.
# 3.- Cualquier célula viva con dos o tres vecinos vivos sobrevive
#a la siguiente generación.
# 4.- Cualquier célula muerta con exactamente tres vecinos vivos
#se convierte en una célula viva.