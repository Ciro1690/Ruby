class Card

    def initialize(up_or_down = false)
        @face_value
        @up_or_down = up_or_down
    end

    def put_cards_down
        cards = ["A","B","C","D","E","F","G","H","A","B","C","D","E","F","G","H"].shuffle
        two_d_cards = Array.new(4) {Array.new(4, '_')}

        two_d_cards[0] = cards[0...4]
        two_d_cards[1] = cards[4...8]
        two_d_cards[2] = cards[8...12]
        two_d_cards[3] = cards[12...16] 
        return two_d_cards 
    end  
end

