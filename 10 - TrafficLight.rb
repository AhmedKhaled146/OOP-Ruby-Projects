# Write a Ruby program to create class called "TrafficLight" with attributes for color and duration,
# and methods to change the color and check for red or green.

class TrafficLight
  attr_accessor :color, :duration

  def initialize(color, duration)
    @color = color
    @duration = duration
  end

  def check_if_green
    @color == "green"
  end

  def check_if_red
    @color == "red"
  end

  def change_color(new_color)
    valid_colors = ["red", "green", "yellow"]
    if valid_colors.include?(new_color)
      @color = new_color
      puts "The traffic light color has changed to #{@color}."
    else
      puts "Invalid color! Please choose red, green, or yellow."
    end
  end
end

# Example usage:
traffic_light = TrafficLight.new("red", 30)

puts traffic_light.check_if_red   # true
puts traffic_light.check_if_green # false

traffic_light.change_color("green")
puts traffic_light.check_if_green # true