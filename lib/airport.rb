class Airport
  require_relative 'weather'
  require_relative 'plane'

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
    add_to_hangar(plane)
  end

  def take_off(plane)
    fail "Plane is not at this airport" unless in_hangar(plane)
    fail 'Unable to take off - weather is stormy' if weather.stormy?
    remove_from_hangar(plane)
  end

  private
  def full?
    planes.count >= capacity
  end

  def in_hangar(plane)
    planes.include?(plane)
  end

  def add_to_hangar(plane)
    plane.landed
    planes << plane
  end

  def remove_from_hangar(plane)
    plane.taken_off
    planes.delete(plane)
  end
end
