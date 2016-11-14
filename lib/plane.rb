require_relative 'weather'

class Plane


  @in_flight = true
  

  def take_off
    raise "Plane cannot take off as it is already in flight"
  end

  def plane_landed
    raise "Plane cannot land as it has already landed" unless @in_flight
    @in_flight = false
  end

  def airport
    raise "Plane cannot be in airport as plane is already flying"
  end

end
