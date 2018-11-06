class Plane

  attr_reader :status
  attr_reader :location

  ALREADY_LANDED_ERROR = "Plane has already landed"
  ALREADY_FLYING_ERROR = "Plane is already flying"

  def initialize
    @status = :flying
    @location = ""
  end

  def land(airport)
    fail ALREADY_LANDED_ERROR if landed?
    airport.arrival(self)
    @status = :landed
    @location = airport
    true
  end

  def take_off(airport = location)
    fail ALREADY_FLYING_ERROR if flying?
    airport.departure(self)
    @status = :flying
    @location = ""
    true
  end

  def flying?
    status == :flying
  end

  def landed?
    status == :landed
  end

end
