# Co-working Space Business
class WorkingSpace
  attr_reader :name, :space_type, :hours

  def initialize
    @name = ''
    @space_type = ''
    @hours = 0
  end
  def greet_user
    puts "Welcome to Alex App Co-Working Space!"
    puts "We have all you need here: \nA- Sharing Space\nB- Meeting Rooms\nC- Interview Room\nD- Sessions Rooms"
    print "What's your name? "
    @name = gets.chomp.capitalize
  end

  def choose_space
    print "Hi #{@name}, which space do you want? (A, B, C, D): "
    @space_type = gets.chomp.upcase
    print "How many hours will you stay? "
    @hours = gets.chomp.to_i
  end

  def describe_choice
    case @space_type
    when "A"
      puts "You chose to take a Sharing Space for #{@hours} hours."
    when "B"
      puts "You chose to take a Meeting Room for #{@hours} hours."
    when "C"
      puts "You chose to take an Interview Room for #{@hours} hours."
    when "D"
      puts "You chose to take a Sessions Room for #{@hours} hours."
    else
      puts "You should make a correct choice."
    end
  end
end

working_space = WorkingSpace.new
working_space.greet_user
working_space.choose_space
working_space.describe_choice