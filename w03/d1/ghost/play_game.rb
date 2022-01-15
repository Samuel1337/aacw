
require_relative 'game'
require_relative 'ai_player'

range = (1..4)
n = 0
until range.include?(n)
    puts "How many will be playing, enter a number between 1 and 4?"
    n = gets.chomp.to_i
end
players = []




(1..n).each do |n|
    puts "Player #{n} name: "
    name = gets.chomp
    players << name
end


g = Game.new(players)
g.players[AI.new] = 0 if n == 1

g.play


