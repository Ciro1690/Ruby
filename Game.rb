require_relative "Board.rb"

class Game

attr_accessor :board

    def initialize
        @board = Board.new
        turn
    end

    def turn
        @board.view_current_grid      
        while !won?
            get_guesses
        end
    end

    def get_guesses
        count = 0
        guess1 = []
        guess2 = []

        while count < 2
            print "Please enter the position of the card you'd like to flip (e.g. '2 3')"
            pos = gets.chomp
            guess = pos.split(" ")
            if valid?(guess)
                x,y = guess[0].to_i, guess[1].to_i
                if count == 0
                    guess1 = [x,y]
                    @board.working[x][y] = @board.grid[x][y]
                    @board.view_current_grid
                    count +=1
                elsif count == 1
                    guess2 = [x,y]
                    @board.working[x][y] = @board.grid[x][y]
                    @board.view_current_grid
                    count +=1 
                end
            end
        end
        if !match?(guess1,guess2)
            @board.working[guess1[0]][guess1[1]] = '_'
            @board.working[guess2[0]][guess2[1]] = '_'
            sleep 2.0
            system("clear")
            @board.view_current_grid
        end
            guess1 = []
            guess2 = []
            count = 0
    end
    
    def valid?(guess)
        values = [0,1,2,3]

        if values.include?(guess[0].to_i) && values.include?(guess[1].to_i)
            true
        else
            false
            print "This is not a valid guess. Please try again."
        end
    end
    
    def match?(guess1,guess2)
        if @board.working[guess1[0]][guess1[1]] == @board.working[guess2[0]][guess2[1]]
            print("It's a match! \n")
            true
        else
            print("Not a match \n")
            false
        end
    end

    def won?
        @board.grid.flatten.include?('_')
    end
end

g = Game.new
