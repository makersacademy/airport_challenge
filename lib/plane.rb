class Plane
  def initialize(weather)
    @weather = weather
  end

  def land(airport)
    raise 'Cannot land due to stormy weather' if @weather.is_stormy

    airport.land_plane(self)
  end

  def take_off
    !@weather.is_stormy
  end
end
