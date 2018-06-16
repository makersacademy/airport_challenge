require_relative './airport.rb'

# Instances know how to land and take of from airports
class Plane
  def land(airport)
    puts "Plane landed safely at #{airport}."
  end
end
