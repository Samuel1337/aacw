require_relative 'employee'

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    sum = 0
    @employees.each { |employee| sum += employee.salary }
    sum * multiplier
  end

  def hire(employee)
    @employees << employee
  end


end