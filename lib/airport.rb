require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity, :weather

  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail 'Plane has already arrived.' if include?(plane)
    fail 'Plane cannot land due to stormy weather.' if weather.stormy?
    fail 'Airport is full!' if full?
    plane.arrive
    store(plane)
  end

  def takeoff(plane)
    fail 'Plane is not at this airport.' unless include?(plane)
    fail 'Plane cannot take off due to stormy weather.' if weather.stormy?
    plane.depart
    remove(plane)
  end

  private

  def include?(plane)
    planes.include?(plane)
  end

  def full?
    planes.count >= DEFAULT_CAPACITY
  end

  def store(plane)
    planes << plane
    plane
  end

  def remove(plane)
    planes.delete(plane)
    plane
  end
end