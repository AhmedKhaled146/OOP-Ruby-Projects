# Write a Ruby program to create a class called "Employee" with a name, salary,
# and hire date attributes, and a method to calculate years of service.

require 'date'

class Employee
  attr_accessor :name, :salary, :hire_date

  def initialize(name, salary, hire_date)
    @name = name
    @salary = salary
    @hire_date = hire_date
  end

  def calc_year_of_service
    if @hire_date > Date.today
      puts "Please enter a valid hire date. It cannot be in the future."
    elsif @hire_date.year == Date.today.year
      months_of_service = Date.today.month - @hire_date.month
      if Date.today.day < @hire_date.day
        months_of_service -= 1
      end
      puts "#{@name}, you have been with the company for #{months_of_service} months."
    else
      years_of_service = Date.today.year - @hire_date.year
      if Date.today < @hire_date.next_year(years_of_service)
        years_of_service -= 1
      end
      puts "#{@name}, your years of service in the company is #{years_of_service} years."
    end
  end

end

# Example Usage:
ahmed = Employee.new("Ahmed", 25000, Date.new(2005, 6, 1))
ahmed.calc_year_of_service
