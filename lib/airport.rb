class Airport
  attr_reader :local_weather
  def initialize
    @planes = []
    @airport_weather_object = Weather.new
    @local_weather = @airport_weather_object.weather
  end

  def land_plane(plane)
    @planes << plane
    plane
  end

  def takeoff_plane
    fail 'No planes available for takeoff' if @planes.empty?

    @planes.pop
    'Plane has taken off'
  end
end
