class Plane
  attr_reader :in_flight

  def initialize(airport = '')
    @in_flight = true
    cleared_to_land(airport) if airport == ''
  end

  def cleared_to_land(airport)
    raise('Plane already landed!') if @in_flight == false

    airport.land_plane(self)
    @in_flight = false
  end

  def cleared_for_take_off(airport)
    raise('Plane already in flight!') if @in_flight == true
    
    airport.plane_departed(self)
    @in_flight = true
  end

end
