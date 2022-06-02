require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(n) #length of the board 
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships

        print @board.num_ships
        @board.print #when do i used .print vs print ??
    end
    
    def lose? 
       if @remaining_misses <= 0 
        p "you lose"
        return true
       else 
        false
       end 
    end

    def win?
       if @board.num_ships == 0 
        p "you win"
        return true
       else
        false
       end
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
       pos =  @player.get_move
        if @board.attack(pos) != true
            @remaining_misses -= 1
        end

        @board.print

        p @remaining_misses

        

    end


end
