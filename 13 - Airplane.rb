# Write a Ruby program to create a class called "Airplane" with a flight number, destination, and departure time attributes,
# and methods to check flight status and delay.

require 'time'

class Airplane
  attr_accessor :flight_number, :destination, :departure_time

  def initialize(flight_number, destination, departure_time)
    @flight_number = flight_number
    @destination = destination
    @departure_time = Time.parse(departure_time)
  end

  def check_flight_status
    current_time = Time.now

    if current_time < @departure_time
      puts "Flight #{@flight_number} to #{@destination} is on schedule."
    elsif current_time >= @departure_time
      puts "Flight #{@flight_number} to #{@destination} has already departed."
    end
  end

  def delay(delay_in_minutes)
    @departure_time += delay_in_minutes * 60 # Convert minutes to seconds
    puts "Flight #{@flight_number} has been delayed by #{delay_in_minutes} minutes."
    puts "New departure time: #{@departure_time.strftime('%H:%M %p')}"
  end

  # Method to display flight details
  def display_flight_info
    puts "Flight Number: #{@flight_number}"
    puts "Destination: #{@destination}"
    puts "Departure Time: #{@departure_time.strftime('%H:%M %p')}"
  end
end

# Create an Airplane instance
xplain = Airplane.new(122, "Sharm", "2024-09-12 15:30")

# Display the flight details
xplain.display_flight_info
puts "--" * 30

# Check flight status
xplain.check_flight_status
puts "--" * 30

# Delay the flight by 30 minutes
xplain.delay(30)
puts "--" * 30

# Check flight status again after delay
xplain.check_flight_status

