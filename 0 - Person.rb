# Write a Ruby program to create a class called "Person" with a name and age attribute.
# Create two instances of the "Person" class, set their attributes using the constructor, and print their name and age.

class Person
  attr_reader :name, :age

  # Initializes a new Person with a name and age.
  def initialize(name, age)
    @name = name
    @age = age
  end

  # Returns a string with the person's details.
  def details
    "Hi, my name is #{@name} and I am #{@age} years old."
  end
end

# an Instance from Person Class
ahmed = Person.new("Ahmed", 24)
heba = Person.new("Heba", 19)

# Print the Details of the Persons
puts ahmed.details
puts heba.details