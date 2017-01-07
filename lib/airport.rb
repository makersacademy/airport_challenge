class Airport

  attr_accessor :arrivals, :departures

  def initialize
    @arrivals = []
    @departures = []

  end

  def land(plane)
    plane::land_plane
    @arrivals << plane
  end

  def depart(plane)
    plane::take_off
    @arrivals.delete(plane)
    @departures << plane
  end

end
