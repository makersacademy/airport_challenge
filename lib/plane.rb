require_relative 'airport'

class Plane

  def land_at(airport)
    airport ||= Airport.new
    fail "I picked the wrong week to stop sniffing glue..." if airport.weather == "storm"
    puts "Coming in to land at #{airport.airport_name}"
    airport.planes << self
    self
  end

  def depart_from(airport)
    airport ||= Airport.new
    fail "We can't take off in a storm" if airport.weather == "storm"
    puts "Taking off from #{airport.airport_name}"
    airport.planes.delete(self)
    self
  end

end
