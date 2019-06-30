require_relative "weather"
require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 5

  include Weather
  attr_reader :planes, :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Cannot land, weather is stormy." if stormy?

    raise "Plane is already at the airport" if @planes.include? plane

    @planes << plane
  end

  def launch_plane(plane)
    raise "Cannot take-off, weather is stormy." if stormy?

    raise "Plane cannot take-off, not in airport." unless @planes.include? plane

    @planes.reject! { |item| item == plane }
  end

  def full?
    raise "Cannot land, airport full." if @planes.length >= @capacity
  end
end
