class Airport
  attr_reader :planes
  attr_accessor :weather

  # initialize the airport
  def initialize
    @planes = []
    weather_options = ['Cloudy', 'Sunny']
    @weather = weather_options[rand(3)]
  end

  # add a plane to the plane array
  def add_plane(plane)
    @planes << plane
  end

  # removes a plane from the plane array
  def remove_plane(plane)
    @planes.delete(plane)
  end

  def clear_weather?
    return true if @weather == 'Sunny'
    return false
  end

end
