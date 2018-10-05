require "./lib/airport.rb"

class Plane

@currentairport
@destination

  def land(airport)
    airport.addtraffic()
    @currentairport = airport
    @destination = nil
    true
  end

  def takeoff(airport)
    airport.reducetraffic()
    @destination = airport
    @currentairport = nil
    true
  end

end
