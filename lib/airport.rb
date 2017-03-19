require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 30

  attr_reader :planes
  attr_reader :weather
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land due to bad weather" if stormy?
    raise "Airport full...jog on" if full?
    add_plane(plane)
    plane.landed?
  end

  def add_plane(plane)
    planes << plane
  end

  def take_off(plane)
    raise "Cannot take off due to bad weather" if stormy?
    planes.delete(plane)
  end

  private

  def stormy?
    @weather.stormy?
  end

  def full?
     planes.size >= capacity
  end

end
