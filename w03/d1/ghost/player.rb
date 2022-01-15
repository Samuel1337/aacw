require_relative 'game'
class Player 
    attr_accessor :name
    def initialize(name)
        @name = name
    end

    def get_letter
        str = ''
        until str.length == 1 && ALPHA.include?(str.downcase)
            str = gets.chomp
            if str.length != 1 
                puts "that was not a valid guess, try again"
            end
            if !ALPHA.include?(str.downcase)
                puts "you need to pick a letter, proper nouns like 2pac don't count in this game"
            end
        end        
        return str.downcase
    end

end