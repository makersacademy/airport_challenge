class Plane
  attr_reader :in_flight
  AVAILABLE_AIRPORTS = [:LHR, :LTN, :LGW]

  def initialize(airport = nil)
    @in_flight = true
    if airport != nil
      cleared_to_land(airport)
    end
  end

  def cleared_to_land(airport)
    airport.land_plane(self)
    @in_flight = false
  end

  def cleared_for_take_off(airport)
    airport.plane_departed(self)
    @in_flight = true
  end

end
