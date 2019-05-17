require_relative '../lib/weather'

class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane, weather = Weather.new)
    raise 'Airport currently closed due to stormy weather' if weather.stormy?
    raise 'Airport is full' if full?

    @hangar << plane
  end

  def take_off(plane, weather = Weather.new)
    raise 'Planes grounded: stormy weather!' if weather.stormy?

    @hangar.delete(plane)
  end

  private

  def full?
    @hangar.count >= @capacity
  end
end
