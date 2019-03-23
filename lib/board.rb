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

end
