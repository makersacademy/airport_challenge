class Airport
  attr_reader :local_weather
  attr_reader :capacity
  attr_writer :local_weather
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @airport_weather_object = Weather.new
    @local_weather = @airport_weather_object.weather
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'The Stormy weather prevents landing' if @local_weather == 'Stormy'
    fail 'The Airport is full' if @planes.count >= capacity

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
