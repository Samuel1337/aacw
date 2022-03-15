require_relative 'employee'

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    total_sub_salary * multiplier

  end

  def total_sub_salary
    sub_sal = 0
    self.employees.each do |person|
      if person.is_a?(Manager)
        sub_sal += person.total_sub_salary + person.salary
      else
        sub_sal += person.salary
      end
    end
    sub_sal
  end


  def hire(employee)
    @employees << employee
  end


end


# ned = Manager.new("ned", "founder", "1000000")
# darren = Manager.new("Darren", "TA Manager", 78000, 'ned')
# david = Employee.new("David", "TA", 10000, 'Darren')
# shawna = Employee.new("Shawna", "TA", 12000, 'Darren')
# ned.hire(darren)
# darren.hire(david)
# darren.hire(shawna)


# p ned.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000