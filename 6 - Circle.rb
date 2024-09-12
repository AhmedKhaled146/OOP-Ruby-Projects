# Write a Ruby program to create a class called "Circle" with a radius attribute.
# You can access and modify this attribute. Calculate the area and circumference of the circle.

class Circle
  attr_accessor :radius
  Pi = Math::PI

  def initialize(radius)
    @radius = radius
  end

  def calc_area
    area = Pi * (radius ** 2)
    puts "The Area of the circle is: #{area.round(2)}"
  end

  def calc_circumference
    circumference = 2 * Pi * radius
    puts "The circumference of the circle is: #{circumference.round(2)}"
  end
end

circle = Circle.new(5)
circle.calc_area
circle.calc_circumference
