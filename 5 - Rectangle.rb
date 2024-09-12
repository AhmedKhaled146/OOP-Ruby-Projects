# Write a Ruby program to create a class called "Rectangle" with width and height attributes.
# Calculate the area and perimeter of the rectangle.


class Rectangle
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def calc_area
    area = @width * @height
    puts " The Area of Rectangle is: #{area}"
  end

  def calc_perimeter
    perimeter = 2 * (@width + @height)
    puts "The Perimeter of the Rectangle is: #{perimeter}"
  end

end

# Create an Instance to calculate

rectangle = Rectangle.new(12, 15)
rectangle.calc_area
rectangle.calc_perimeter