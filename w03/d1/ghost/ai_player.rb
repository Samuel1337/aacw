require_relative 'game'
class AI 
    attr_accessor :name
    def initialize
        @name = "Boop Beep Beep"
    end

    def get_letter
        str = ALPHA.sample
    end

end