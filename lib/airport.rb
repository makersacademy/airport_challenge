require 'weather'
class Airport
  attr_reader :capacity, :weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
    @weather = Weather.new.stormy?
  end

  def full?
    @landed_planes.count >= @capacity
  end

  def land(plane)
    @landed_planes << plane
  end

  def take_off(plane)
    @landed_planes.delete(plane)
  end

  def at_airport?(plane)
    @landed_planes.include?(plane)
  end

end
