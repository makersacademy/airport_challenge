class Plane

  def initialize
    @clearance = false
  end

  def land(airport)
    airport.clear_to_land
  end

  def clearance?
    @clearance
  end

  def cleared_to_land
    @clearance = true
  end
end
