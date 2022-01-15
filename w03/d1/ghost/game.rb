ALPHA = "abcdefghijklmnopqrstuvwxyz".split("")
GHOST = "GHOST"
DICTIONARY = File.read('fullDictionary.txt').split(/\n+/).product([nil]).to_h
require_relative "player"
class Game
    
    attr_reader :current_player, :fragment, :scoreboard
    attr_accessor :players

    def initialize(gamers)
        @players = {}
        gamers.each {|gamer| @players[Player.new(gamer)] = 0}
        @fragment = ""
        @current_player = players.keys[0]
        @previous_player = ''
        @count = 1
    end

    def next_player!
        @previous_player = @current_player
        current_idx = @players.keys.index(@current_player)
        new_idx = (current_idx + 1) % (@players.keys.length)
        @current_player = @players.keys[new_idx]
    end

    def take_turn
        @fragment += @current_player.get_letter
        self.next_player!
    end

    def invalid_letter
        range = (0...fragment.length)
        DICTIONARY.keys.none?{|word| word[range] == @fragment }
    end

    def check_for_loss
        DICTIONARY.keys.any?{|word| word == @fragment }
    end

    def round
        puts "Round #{@count}:"
        until invalid_letter || check_for_loss
            puts "#{@current_player.name}, make a guess: ".chomp
            self.take_turn
            self.invalid_letter
            print "The current fragment is '#{@fragment}'"
            puts
            puts "------------------------"
        end

        if DICTIONARY.keys.include?(fragment)
            puts "You finished the word #{@previous_player.name}, so you lose."
        else
            puts "#{@fragment} is not a word so #{@previous_player.name} loses."
        end

        @count += 1
        @fragment = ""
        @players[@previous_player] += 1
    end

    def remove_player(player)
        @players.delete(player)
    end

    def print_standings
        puts "\n-------STANDINGS--------"
        @players.each do |k, v|
            if v == 0
                puts "#{k.name}: " 
            else
                puts "#{k.name}: " + GHOST[0..v-1]
            end
        end
        puts "------------------------"

    end

    def play 
        until @players.keys.length == 1
            self.round
            self.print_standings
            @players.each do |player, score|
                if score == 5
                    puts "Sorry, #{player.name}, but you are OUT!!"
                    remove_player(player)
                end
            end
        end
        winner = ""
        @players.keys.each {|player| winner += player.name}
        puts 
        puts "||#{winner} wins!||"
        puts 
    end


end
