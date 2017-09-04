require_relative 'airplane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_accessor :airplanes

  def initialize(capacity = DEFAULT_CAPACITY)
    @airplanes = []
    @capacity = capacity
  end

  def land(airplane, weather)
    fail 'Cannot land since airport is full' if full?
    fail 'Unable to land due to stormy weather' if weather.stormy?
    airplane.land
    @airplanes << airplane
    self
  end

  def takeoff(airplane, weather)
    fail 'No airplanes in the airport' if empty?
    fail 'Cannot take off due to stormy weather' if weather.stormy?
    airplane.takeoff
    @airplanes.delete(airplane)
  end

  private

  def full?
    @airplanes.count >= capacity
  end

  def empty?
    @airplanes.empty?
  end
end
