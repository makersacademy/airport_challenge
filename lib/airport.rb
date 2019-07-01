class Airport
  attr_reader :local_weather
  attr_reader :capacity
  attr_reader :airport_id
  attr_writer :local_weather
  DEFAULT_CAPACITY = 5

  def initialize(airport_id: "Toby's Airport", capacity: DEFAULT_CAPACITY)
    @planes = []
    @airport_weather_object = Weather.new
    @local_weather = @airport_weather_object.weather
    @capacity = capacity
    @airport_id = airport_id
  end

  def land_plane(plane)
    fail 'The Stormy weather prevents landing' if stormy?
    fail 'The Airport is full' if full?
    fail 'A plane cannot land if it is not flying' unless plane.flying?

    plane.state = @airport_id
    @planes << plane
    plane
  end

  def takeoff_plane
    fail 'No planes available for takeoff' if empty?
    fail 'The Stormy weather prevents takeoff' if stormy?
    fail 'Only locally stored planes can takeoff' if stored?

    @planes.pop
    'Plane has taken off'
    # doesn't set plane to flying
  end

  def regenerate_weather
    puts "Regenerating weather - it is currently #{@local_weather}!"
    @local_weather = @airport_weather_object.generate_weather
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= capacity
  end

  def stormy?
    @local_weather == 'Stormy'
  end

  def flying?
    plane.state == 'Flying'
  end

  def stored?
    @planes[-1].state != @airport_id
  end
end
