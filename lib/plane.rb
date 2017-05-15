require_relative 'airport'

class Plane

  attr_reader :flying

  def initialize
    @flying = "flying"
  end

  def land_at(airport)
    land_guard_conditions(airport)
    puts "#{self} is coming in to land at #{airport.airport_name}"
    airport.planes << self
    flying_switch
  end

  def land_guard_conditions(airport)
    fail "There's no space to land" if airport.planes.count == airport.capacity
    fail "Looks like I picked the wrong week to quit sniffing glue..." if airport.weather == "storm"
    fail "This plane is already landed" if flying == "landed"
  end

  def depart_from(airport)
    depart_guard_conditions(airport)
    puts "#{self} has taken off from #{airport.airport_name}"
    airport.planes.delete(self)
    flying_switch
  end

  def depart_guard_conditions(airport)
    fail "This plane isn't at this airport" unless airport.planes.include?(self)
    fail "We can't take off in a storm" if airport.weather == "storm"
  end

  def flying_switch
    @flying == "flying" ? @flying = "landed" : @flying = "flying"
    self
  end

  def flight_path(airport1, airport2)
      depart_from(airport1)
    begin
      land_at(airport2)
    rescue
      puts "returning to #{airport1}"
      land_at(airport1)
    end
  end

end
