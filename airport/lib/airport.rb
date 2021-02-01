class Airport

  attr_reader :hanger

  def initialize
    @planes = []
  end

  def plane_to_land(flight_number)
    @planes << flight_number
  end

  def hanger
    @planes
  end

  def plane_takeoff(flight_number)
    @planes.delete(flight_number)
    p @planes
  end
  def no_landing
    @planes.length
  end

end
