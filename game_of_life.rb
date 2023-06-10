# frozen_string_literal: true

# rubocop:disable Style/Documentation

class GameOfLife
  attr_reader :rows, :cols, :board

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @board = Array.new(@rows) { Array.new(@cols, 0) }
  end

  def imprimir_tablero
    @board.each do |rows|
      puts rows.join(' ')
    end
  end
end

# Este es el código para ver los vecinos vivosdef explore(grid, r, c, columns, rows)
def comparison(grid, row, col)
  return 1 if grid[row][col] == 1

  0
end

def explore(grid, row, col, columns)
  alive = 0
  # upper row
  if row - 1 >= 0
    alive += comparison(grid, row - 1, col)
    alive += comparison(grid, row - 1, col - 1) if col - 1 >= 0
    alive += comparison(grid, row - 1, col + 1) if col + 1 < columns
  end
  # same row
  alive += comparison(grid, row, col - 1) if col - 1 >= 0
  alive += comparison(grid, row, col + 1) if col + 1 < columns
  # lower row
  if row + 1 < grid.length
    alive += comparison(grid, row + 1, col)
    alive += comparison(grid, row + 1, col - 1) if col - 1 >= 0
    alive += comparison(grid, row + 1, col + 1) if col + 1 < columns
  end
  alive
end

def update_grid(grid, row, col, new_board, alive_neighbors)
  if (grid[row][col]).zero?
    if alive_neighbors == 3
      new_board[row][col] = 1
      # "---Esta célula ahora está viva---"
    end
  elsif alive_neighbors < 2
    new_board[row][col] = 0
  # "---MUERTE---"
  elsif alive_neighbors > 3
    new_board[row][col] = 0
  # "---MUERTE---"
  elsif [2, 3].include?(alive_neighbors)
    new_board[row][col] = 1
    # "---SOBREVIVE---"
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
  (0..board.rows - 1).each do |r|
    # 0 - 4
    (0..board.cols - 1).each do |c|
      # (0,1)
      vivos = explore(board.board, r, c, board.cols)
      # puts "#{r},#{c} tiene valor #{board.board[r][c]} tiene #{vivos} vecinos vivos"
      update_grid(board.board, r, c, board_copia.board, vivos)
    end
  end

  puts "\n"
  g += 1
  puts "Generación #{g}"
  board_copia.imprimir_tablero

  board = board_copia
end
