require_relative 'airport'

class Plane
  attr_accessor :in_air, :in_other
  def initialize(in_air = false)
    @in_air = in_air
    @in_other = false
  end

  def land(airport,plane)
    airport.airport_check(plane)
    raise "plane already in airport" if plane.check(plane) == false
    plane.in_air = false
    plane.in_other = true
    airport.run_way << plane
  end

  def take_of(airport,plane)
    airport.airport_check(plane)
    fly_check(airport,plane)
    raise "plane already in air" if plane.check(plane) == true
    plane.in_air = true
    plane.in_other = false
    airport.run_way.delete(plane)
  end

  def check(plane)
    if plane.in_air == true
      true
    elsif plane.in_air == false
      false
    end
  end

  def fly_check(airport,plane)
  if airport.run_way.include?(plane) == false && plane.in_air == true
  elsif
    airport.run_way.include?(plane) == false && plane.in_air == false && plane.in_other == true
  raise "plane is not in this airport"
  end
end

end
