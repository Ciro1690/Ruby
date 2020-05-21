require "set"
require_relative 'player'
require 'byebug'

class Game
    ALPHABET = Set.new("a".."z")

    def initialize(player_1,player_2)
        @player_1 = Player.new(player_1)
        @player_2 = Player.new(player_2)
        @current_player = @player_1
        @words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(@words)
        @fragment = ""
        run
    end

    def run
        take_turn(@current_player) until game_over?
        print @current_player + ", you won!"
    end
    
    def game_over?
        if @dictionary.include?(@fragment)
            puts "This is a sentence. Game over."
            print @current_player.name + ", you won!"
            exit
            true
        end
        false
    end

    def take_turn(player)
        print "Enter a character " + @current_player.name + ": "
        char = gets.chomp
        puts char

        if valid_play?(char)
            switch_turn
            @fragment += char 
            puts "Word so far: " + @fragment
        end
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def valid_play?(letter)
        if !ALPHABET.include?(letter)
            puts"not a valid letter"
            false
        else
            true
        end
    end        
end

print "Please enter the first player's name: "
p_1 = gets.chomp
print "Please enter the second player's name: "
p_2 = gets.chomp
Game.new(p_1,p_2)
