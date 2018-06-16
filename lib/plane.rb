require_relative './airport.rb'

# Instances know how to land and take of from airports
class Plane

  attr_accessor :at_airport

  def land(airport)
    puts "Plane landed safely at #{airport}."
    at_airport = true
  end

  def takeoff
    puts "Plane took off successfully."
    at_airport = false
  end

  def at_airport?
    at_airport
  end
end
