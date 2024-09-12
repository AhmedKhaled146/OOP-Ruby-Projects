# Write a Ruby program to create a class called "Dog" with a name and breed attribute.
# Create two instances of the "Dog" class, set their attributes using the constructor
# and modify the attributes using the setter methods and print the updated values.


class Dog
  attr_accessor :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  # Method to display dog's information (Encapsulation)
  def display_details
    puts "Dog's Name: #{@name}, Breed: #{@breed}"
  end
end

# Create instances
bulldog = Dog.new("jac", "bulldog")
beagle = Dog.new("buku", "beagle")

# Print details before updating
bulldog.display_details

# Updating attributes
bulldog.name = "koku"
bulldog.breed = "anti"

# Print details after updating
bulldog.display_details
