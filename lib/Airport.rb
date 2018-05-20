require_relative 'Plane'
class Airport
  attr_reader :planes, :capacity
  attr_accessor :weather
  DEFAULTCAPACITY = 20
  # initialize the airport
  def initialize(capacity = DEFAULTCAPACITY)
    @planes = []
    weather_options = ['Cloudy', 'Sunny']
    @weather = weather_options[rand(3)]
    @capacity = capacity
  end

  # add a plane to the plane array
  def add_plane(plane)
    @planes << plane
  end

  # removes a plane from the plane array
  def remove_plane(plane)
    @planes.delete(plane)
  end

  # checks if weather is clear, returns true if it is
  def clear_weather?
    return true if @weather == 'Sunny'
    return false
  end

  # how many more planes can be landed
  def remaining_capacity
    return @capacity - @planes.length
  end

end
