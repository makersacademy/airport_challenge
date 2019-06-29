class Airport
  attr_reader :local_weather
  attr_writer :local_weather
  def initialize
    @planes = []
    @airport_weather_object = Weather.new
    @local_weather = @airport_weather_object.weather
  end

  def land_plane(plane)
    fail 'The Stormy weather prevents landing' if @local_weather == 'Stormy'
    
    @planes << plane
    plane
  end

  def takeoff_plane
    fail 'No planes available for takeoff' if @planes.empty?
    fail 'The Stormy weather prevents takeoff' if @local_weather == 'Stormy'

    @planes.pop
    'Plane has taken off'
  end

  def regenerate_weather
    puts "Regenerating weather - it is currently #{@local_weather}!"
    @local_weather = @airport_weather_object.generate_weather
  end
end
