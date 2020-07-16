class Plane

  attr_reader :location
  attr_reader :status

  def initialize(location = "airport", status = "on the ground")
    @location = location
    @status = status
  end

  def take_off(airport)
    return "Cannot take off as the plane is at the different airport" if @location != airport.name

    @location = "in the air"
    @status = "flying"
    airport.take_off(self)
  end

  def land(airport)
    return "Cannot land as the airport is full" if airport.full?
    return "Cannot land as the plane is already on the airport" if @status == "on the ground"

    @location = airport.name
    @status = "on the ground"
    airport.land(self)
  end

end
