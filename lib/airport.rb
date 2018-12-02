require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 2
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new.weather
  end

  def land(plane)
    raise 'Plane already landed' unless plane.flying
    raise 'Airport at capacity' if full?
    raise 'Plane cannot land due to stormy weather' if stormy?
    plane.stop_flying
    hangar << plane
  end

  def take_off(plane)
    raise 'Plane already flying' if plane.flying
    raise 'Plane not in current airport' unless in_airport?(plane)
    raise 'Plane cannot take_off due to stormy weather' if stormy?
    plane.start_flying
    hangar.delete(plane)
  end

  def in_airport?(plane)
    hangar.include?(plane)
  end

  private

  attr_reader :hangar, :weather

  def stormy?
    weather == :stormy
  end

  def full?
    hangar.count >= capacity
  end

end
