require_relative 'airport'

class Plane
  attr_accessor :in_air
  def initialize(in_air = false)
    @in_air = in_air
  end

  def land(airport,plane)
  raise "plane already in airport" if plane.check(plane) == false
    plane.in_air = false
    airport.run_way << plane
  end

  def take_of(airport,plane)
  raise "plane already in air" if plane.check(plane) == true
    plane.in_air = true
    airport.run_way.delete(plane)
  end

  def check(plane)
  if plane.in_air == true
    true
  elsif plane.in_air == false
    false
  end
end
end
