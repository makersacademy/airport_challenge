require_relative './airport.rb'

# Instances know how to land and take of from airports
# and can report if they are currently at an airport.
class Plane

  attr_accessor :at_airport

  def land(airport)
    raise "Cannot land due to stormy weather." if airport.stormy?
    puts "Plane landed safely at #{airport}."
    @at_airport = airport
  end

  def takeoff
    raise "Cannot take off due to stormy weather." if @at_airport.stormy?
    puts "Plane took off successfully."
    @at_airport = nil
  end

  def at_airport?
    at_airport
  end
end
