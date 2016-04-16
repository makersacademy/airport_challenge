

class Plane

  def initialize
    @location = "Airplane factory"
  end

  def land
    @location = "Airport"
    "That was a bumpy landing sir"
  end

  def take_off
    @location = "Where eagles soar"
    "I can see my house from here"
  end

  def broadcast_location
    location
  end

  private
  attr_reader :location


end
