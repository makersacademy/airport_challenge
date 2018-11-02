class Plane

  attr_reader :status
  attr_reader :location

  def initialize
    @status = "flying"
    @location = ""
  end

  def land(airport)
    return false if !airport.arrival(self) || landed?
    @status = "landed"
    @location = airport
    true
  end

  def take_off(airport)
    return false if !airport.departure(self) || flying?
    @status = "flying"
    @location = ""
    true
  end

  def flying?
    status == "flying"
  end

  def landed?
    status == "landed"
  end

end
