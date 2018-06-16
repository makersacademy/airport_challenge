require_relative './airport.rb'

# Instances know how to land and take of from airports
# and can report if they are currently at an airport.
class Plane

  attr_accessor :at_airport

  def land(airport)
    puts "Plane landed safely at #{airport}."
    @at_airport = true
  end

  def takeoff
    puts "Plane took off successfully."
    @at_airport = false
  end

  def at_airport?
    at_airport
  end
end
