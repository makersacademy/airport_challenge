require "./lib/airport.rb"

class Plane

  def initialize
    @currentairport = ""
    @destination=""
    @state="landed"
  end

  def land(airport, weather)
    raise "Already landed; Cant do it twice!" unless @state == "flying"
    raise "Bad weather; no landing" unless weather == "sunny"
    airport.addtraffic(self)
    @currentairport = airport
    @destination = nil
    @state="landed"
  end

  def takeoff(airport, weather)
    raise "Already flying; Cant takeoff again!" unless @state == "landed"
    raise "Bad weather; no takeoff" unless weather == "sunny"
    airport.reducetraffic(self)
    @destination = airport
    @currentairport = nil
    @state="flying"
  end

end
