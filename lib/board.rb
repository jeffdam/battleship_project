require "byebug"

class Board
  
    attr_reader :size

    def initialize(num)
        @grid = Array.new(num) { Array.new(num, :N) }
        @size = num ** 2
    end

    def [](pos)
        a,b = pos
        @grid[a][b]
    end

    def []=(pos, val)
        a,b = pos
        @grid[a][b] = val
    end

    def num_ships
        count = 0
        @grid.each_with_index do |row, row_i|
            row.each_with_index do |col, col_i|
                count += 1 if @grid[row_i][col_i] == :S
            end
        end

        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        allpos = all_pos
        until num_ships == (@size * 0.25).to_i
            pos = allpos.shift
            self[pos] = :S
        end
    end

    def all_pos
        all_pos = []
        (0...@grid.length).each do |a|
            (0...@grid.length).each do |b|
                all_pos << [a,b]
            end
        end
        all_pos.shuffle
    end

    def hidden_ships_grid
        @grid.map.with_index do |row, row_i|
            row.map.with_index do |col, col_i|
                if @grid[row_i][col_i] == :S
                    :N
                else
                    @grid[row_i][col_i]
                end
            end
        end
    end

    def self.print_grid(board)
        board.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
