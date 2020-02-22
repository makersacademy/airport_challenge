class Plane

  attr_reader :location
  attr_reader :status

  def initialize(location = "airport", status = "landed")
    @location = location
    @status = status
  end

  def take_off(airport)
    @location = "in the air"
    @status = "flying"
    airport.take_off(self)
  end

  def land(airport)
    return "Cannot land as the airport is full" if airport.full?
    
    @location = airport.name
    @status = "landed"
    airport.land(self)
  end

end
