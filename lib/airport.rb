require "weather"

class Airport
  DEFAULT_CAPACITY = 5

  include Weather
  attr_reader :planes, :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    return "Cannot land, weather is stormy." if stormy?

    @planes << plane
  end

  def launch_plane(plane)
    return "Cannot take-off, weather is stormy." if stormy?

    @planes.reject { |item| item == plane }
  end

  def full?
    "Cannot land, airport full." if @planes.length >= @capacity
  end
end
