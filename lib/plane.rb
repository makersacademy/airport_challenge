class Plane

  attr_reader :status
  attr_reader :location

  def initialize
    @status = "flying"
    @location = ""
  end

  def land(airport)
    return false if !airport.arrival(self) || is_landed?
    @status = "landed"
    @location = airport
    true
  end

  def take_off(airport)
    return false if !airport.departure(self) || is_flying?
    @status = "flying"
    @location = ""
    true
  end

  def is_flying?
    status == "flying"
  end

  def is_landed?
    status == "landed"
  end

end
