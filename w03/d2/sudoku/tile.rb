require 'colorize'
class Tile
  attr_reader :given

  attr_accessor :value

  def initialize(value)
    @value = value
    if value == "0"
      @given = false
    else
      @given = true
    end
  end
  
  def to_s
    if @given == true
      @value.white.on_black
    elsif @value == "0"
      "_".red
    else
      @value.to_s.red
    end
  end


end
