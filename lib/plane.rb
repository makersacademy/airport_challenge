class Plane
  def initialize(weather)
    @weather = weather
  end

  def land(airport)
    airport.land_plane(self)
  end

  def take_off
    @weather.get == 'sunny'
  end
end
