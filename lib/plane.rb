class Plane

  attr_reader :status
  attr_reader :location

  def initialize
    @status = "flying"
    @location = ""
  end

  def land(airport)
    return false if airport.arrival(self) == false || status == "landed"
    @status = "landed"
    @location = airport
  end

  def take_off(airport)
    return false if airport.departure(self) == false || status == "flying"
    @status = "flying"
    @location = ""
  end

end
