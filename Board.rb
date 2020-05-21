class Board

attr_accessor :grid, :working

    def initialize      
        @grid = complete_grid
        @working = Array.new(4) {Array.new(4, '_')}
    end

    def complete_grid
        cards = ["A","B","C","D","E","F","G","H","A","B","C","D","E","F","G","H"].shuffle
        two_d_cards = Array.new(4) {Array.new(4, '_')}

        two_d_cards[0] = cards[0...4]
        two_d_cards[1] = cards[4...8]
        two_d_cards[2] = cards[8...12]
        two_d_cards[3] = cards[12...16] 
        return two_d_cards 
    end  

    def view_current_grid
        (0..@working.length-1).each do |row|
            p @working[row]
        end
    end
end

b = Board.new