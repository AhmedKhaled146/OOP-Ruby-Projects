# Write a Ruby program to create a class called "Student" with a name, grade, and courses attributes,
# and methods to add and remove courses.


class Student
  attr_accessor :name, :grade, :courses

  def initialize(name, grade)
    @name = name
    @grade = grade
    @courses = []
  end

  def add_course(course)
    @courses << course
    puts "#{course} was added"
  end

  def remove_course(course)
    if @courses.include?(course)
      @courses.delete(course)
      puts "#{course} was removed from student #{@name}"
    else
      puts "#{course} is not found in the course list."
    end
  end

  def show_courses
    puts "All Courses for student #{@name}"
    @courses.each { |course| puts "- #{course}" }
  end

end


ahmed_std = Student.new("ahmed", 24)

ahmed_std.add_course("chema")
ahmed_std.add_course("math")
ahmed_std.add_course("english")
puts "--" * 50
ahmed_std.show_courses
puts "--" * 50
ahmed_std.remove_course("english")
puts "--" * 50
ahmed_std.show_courses