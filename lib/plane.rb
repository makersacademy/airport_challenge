require_relative 'weather'

class Plane

  def initialize
    @in_flight = true
  end

  def take_off
    raise "Plane cannot take off as it is already in flight" if in_flight
  end

  def plane_landed(airport)
    raise "Plane cannot land as it has already landed" if landed 
    @in_flight = false
    @airport = airport
  end

  def airport
    raise "Plane cannot be in airport as plane is already flying" if in_flight
    @airport
  end

private

  attr_reader :in_flight

def landed
  !in_flight
end

end
