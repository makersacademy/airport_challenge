class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 100

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Unable to land - weather is stormy' if weather.stormy?
    fail 'Airport at full capacity' if full?
    plane.landed
    planes << plane
  end

  def take_off(plane)
    fail 'Unable to take off - weather is stormy' if weather.stormy?
    plane.taken_off
    planes.delete(plane)
  end

  private

  def full?
    planes.count >= capacity
  end

end
