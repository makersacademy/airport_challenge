class Plane
  def initialize(weather)
    @weather = weather
  end

  def land(airport)
    raise 'Cannot land due to stormy weather' if @weather.get == 'stormy'

    airport.land_plane(self)
  end

  def take_off
    @weather.get == 'sunny'
  end
end
