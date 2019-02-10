class Plane
  attr_reader :is_airborne
  
  def initialize(is_airborne = false)
    @is_airborne = is_airborne
  end

  def land(airport)
    raise 'Plane is already on the ground' unless @is_airborne

    airport.land_plane(self)
    @is_airborne = false
  end

  def take_off(airport)
    raise 'Plane is already airborne' if @is_airborne

    airport.take_off_plane(self)
    @is_airborne = true
  end
end
