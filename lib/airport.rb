require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail 'hangar full' if full?
    fail 'plane already in hangar' if @planes.include?(plane)
    fail 'cannot land due to stormy weather' if weather.stormy?
    @planes << plane
  end

  def take_off(plane)
    fail 'hangar empty' if empty?
    @planes.delete(plane)
    plane.current_location = 'flying'
    return @planes
  end

private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
