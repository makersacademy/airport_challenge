require "./lib/airport.rb"

class Plane

  def initialize
    @currentairport = ""
    @destination=""

  end

  def land(airport, weather)
    raise "Bad weather; no landing" unless weather == "sunny"
    airport.addtraffic(self)
    @currentairport = airport
    @destination = nil
    true
  end

  def takeoff(airport, weather)
    raise "Bad weather; no takeoff" unless weather == "sunny"
    airport.reducetraffic(self)
    @destination = airport
    @currentairport = nil
    true
  end

end
