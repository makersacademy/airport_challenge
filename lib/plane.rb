class Plane
  attr_reader :location, :flight_number

  def initialize
    @location = "Flying"
    @flight_number = rand(100..999)
  end

  def land(airport)
    @location = airport if airport.land(self)
  end

  def take_off
    @location.take_off(self)
  end

end
