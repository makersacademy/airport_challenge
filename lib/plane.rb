class Plane
  def initialize(weather, is_airborne = false)
    @weather = weather
    @is_airborne = is_airborne
  end

  def land(airport)
    raise 'Plane is already on the ground' unless @is_airborne
    raise 'Cannot land due to stormy weather' if @weather.is_stormy

    airport.land_plane(self)
  end

  def take_off
    raise 'Plane is already airborne' if @is_airborne
    raise 'Cannot take off due to stormy weather' if @weather.is_stormy

    @is_airborne = true
  end
end
