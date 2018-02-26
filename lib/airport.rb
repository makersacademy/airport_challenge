class Airport

  def initialize
    @airport = []
  end

  def create_plane
    Plane.new
  end

  def create_weather
    Weather.new
  end

  def plane_lands(plane)
    @airport << plane
  end

  def plane_takeoff
    raise 'Plane grounded, weather is stormy' if weather.stormy
    @airport.pop
  end
end
