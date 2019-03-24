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

end
