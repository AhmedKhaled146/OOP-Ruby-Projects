# Write a Ruby program to create a class called "Employee" with a name, job title, and salary attributes,
# and methods to calculate and update salary.


class Employee
  attr_accessor :name, :job_title, :salary

  def initialize(name, job_title, salary)
    @name = name
    @job_title = job_title
    @salary = salary
  end

  def show_salary
    puts "Your Salary is: #{@salary}"
  end

  def calc_salary(bonus)
    net_salary = bonus + @salary
    puts "Your Salary is: #{net_salary}"
  end

  def update_salary(new_salary)
    if new_salary > 0
      @salary = new_salary
      puts "Your Updated Salary is: #{@salary}"
    else
      puts "Invalid salary input!"
    end
  end

end

emp_1 = Employee.new("ahmed", "software engineer", 25000)

emp_1.show_salary
emp_1.calc_salary(1000)
emp_1.update_salary(25500)