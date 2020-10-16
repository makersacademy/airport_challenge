class Airport
  def initialize
    @airport = []
  end

  def plane_land(aeroplane)
    @airport << aeroplane
    "Plane safely landed at airport"
  end

  def takeoff
    @airport.pop
    "Plane takeoff successful"
  end

  def conformation
    return "Confirmed, the aeroplane has left the airport" if @airport.length.zero?
  end
end
