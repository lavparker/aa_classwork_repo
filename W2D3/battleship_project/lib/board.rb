# class Board
#     attr_reader :size
#     def initialize(n)
#         @grid = Array.new(n){Array.new(n, :N)}
#         @size = (n * n)
#     end
    
#     def [](pos)
#         row, col = pos
#         @grid[row][col]
#     end
    
#     def []=(pos, val)
#         row, col = pos
#         @grid[row][col] = val
#     end
    
#     def num_ships
#         @grid.flatten.count(:S)
#     end
    
#     def attack(pos)
#         if self[pos] == :S
#             self[pos]= :H
#             p "you sunk my battleship!"
#             return true
#         elsif self[pos] != :S
#             self[pos]= :X
#             false
#         end
#     end

# end

class Board

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(" ")
        end
    end

    attr_reader :size
    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)} #creates matrix
        @size = (n * n) #tells you the size of grid i.e. 4x4
    end

    def [](pos) #returns the element sin the pos in the grid
      
        row,col = pos #why do i have to define the pos like this?
        @grid[row][col]
    end

    def []=(pos, val) #takes in a value is :S(ship) and gives back the position
        row, col = pos #why do i have to define the pos like this?
        @grid[row][col] = val 
    end

    def num_ships
         @grid.flatten.count(:S)
    end
    
    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        numofShips = 0.25 * size 

        while num_ships < numofShips
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |el|
                if el == :S
                    el = :N
                else
                    el
                end
            end
        end
   
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end