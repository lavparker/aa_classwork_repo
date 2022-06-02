class Player
    def get_move
        print "enter a position with coordinates separated with a space like '4 7'"

        position = gets.chomp
        pos = []
        position.split(" ").each {|n| pos << n.to_i}
        pos
    end
end
