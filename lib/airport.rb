require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Cannot land plane that has landed!" if @planes.include? plane
    raise "Cannot land plane while weather is stormy!" if @weather.conditions == "STORMY"
    raise "Cannot land more planes on site than maximum capacity!" if full?
    add_plane(plane)
  end

  def takeoff(plane)
    raise "Cannot takeoff a plane that isn't on site!" unless @planes.include? plane
    raise "Cannot takeoff plane while weather is stormy!" if @weather.conditions == "STORMY"
    remove_plane(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def add_plane(plane)
    @planes << plane
  end

end
