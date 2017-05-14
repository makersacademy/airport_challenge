require_relative 'airport'

class Plane

  attr_reader :flying

  def initialize(flying: "flying")
    @flying = flying
  end

  def land_at(airport)
    fail "There's no space to land" if airport.planes.count == airport.capacity
    fail "Looks like I picked the wrong week to quit sniffing glue..." if airport.weather == "storm"
    fail "This plane is already landed" if flying == "landed"
    puts "#{self} is coming in to land at #{airport.airport_name}"
    airport.planes << self
    flying_switch
  end

  def depart_from(airport)
    fail "This plane isn't at this airport" unless airport.planes.include?(self)
    fail "We can't take off in a storm" if airport.weather == "storm"
    puts "#{self} has taken off from #{airport.airport_name}"
    airport.planes.delete(self)
    flying_switch
  end

  def flying_switch
    @flying == "flying" ? @flying = "landed" : @flying = "flying"
    self
  end

end
