class Airport
  require_relative 'weather'
  require_relative 'plane'

  attr_reader :hangar, :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 100

  def initialize(weather = Weather.new)
    @hangar = []
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
    hangar.count >= capacity
  end

  def in_hangar(plane)
    hangar.include?(plane)
  end

  def add_to_hangar(plane)
    plane.landed
    hangar << plane
  end

  def remove_from_hangar(plane)
    plane.taken_off
    hangar.delete(plane)
    "#{plane} has now left airport"
  end
end
