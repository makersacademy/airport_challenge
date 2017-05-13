require_relative 'airport'

class Plane

  def land_at(airport)
    airport ||= Airport.new
    fail "There's no space to land" if airport.planes.count == airport.capacity
    fail "I picked the wrong week to stop sniffing glue..." if airport.weather == "storm"
    puts "Coming in to land at #{airport.airport_name}"
    airport.planes << self
    self
  end

  def depart_from(airport)
    airport ||= Airport.new
    fail "This plane isn't at this airport" unless airport.planes.include?(self)
    fail "We can't take off in a storm" if airport.weather == "storm"
    puts "Taking off from #{airport.airport_name}"
    airport.planes.delete(self)
    self
  end

end
