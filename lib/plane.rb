class Plane

  def initialize
    @currentairport = ""
    @destination=""
    @state="flying"
  end

  def land(airport)
    raise "Already landed; Cant do it twice!" unless @state == "flying"
    @currentairport = airport
    @destination = nil
    @state="landed"
  end

  def takeoff(airport)
    raise "Already flying; Cant takeoff again!" unless @state == "landed"
    @destination = airport
    @currentairport = nil
    @state="flying"
  end

end
