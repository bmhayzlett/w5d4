require_relative "pieces"

class Knight < Piece

  def initialize(position, board, color)
    super(position, board, color)
    @value = " ♞ "
  end

  def moves

    row, col = @position
    n = @board.grid.length - 1
    possible_moves = []
    [-1, -2, 1, 2].each do |delta_row|
      [-1, -2, 1, 2].each do |delta_col|
        unless delta_row.abs == delta_col.abs
          possible_moves << [row + delta_row, col + delta_col]
        end
      end
    end

    possible_moves.select do |pos|
      @board.in_bounds?(pos) && pos != @position
    end

  end

  def valid_moves
    filtered_moves = []
    moves.each do |pos|
      row, col = pos[0], pos[1]
      obj = @board.grid[row][col]
      if obj.color.nil? && obj.color != @color
        filtered_moves << pos
      end
    end
    filtered_moves
  end

end
