require_relative 'employee'

class Manager < Employee

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end


end