class Plane

  def initialize
    @status = {message: "Not in operation", airport: nil}
  end

  def take_off(airport)
    fail "Already flying... Has taken off from airport " + @status[:airport].to_s if @status[:message] == "Has taken off"
    fail "Cannot take off in adverse weather" if airport.weather == "storm"
    fail "Cannot take off from an airport I'm not in" unless airport.planes.include?(self)
    airport.remove(self)
    @status = {message: "Has taken off", airport: airport}
  end

  def land(airport)
    fail "Already landed... Landed at airport " + @status[:airport].to_s if @status[:message] == "Landed"
    fail "Cannot land - airport is full" if airport.planes.count == airport.capacity
    fail "Cannot land in adverse weather" if airport.weather == "storm"
    airport.add(self)
    @status = {message:"Landed", airport: airport}
  end

  def status
    if @status[:message] == "Has taken off"
      @status[:message] + " from airport "+ @status[:airport].to_s
    elsif @status[:message] == "Landed"
      @status[:message] + " at airport " + @status[:airport].to_s
    else
      @status[:message]
    end
  end

end
