require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Aiport is full' if full?
    fail 'Cannot land due to stormy weather' if bad_weather
    confirm_landing(plane)
  end

  def take_off(plane)
    fail 'Airport is empty' if empty?
    fail 'Cannot take off due to stormy weather' if bad_weather
    confirm_take_off(plane)
  end

  def bad_weather
    Weather.new.stormy?
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  def confirm_landing(plane)
    plane.landed
    planes << plane
    "The plane has landed"
  end

  def confirm_take_off(plane)
    plane.took_off
    planes.delete(plane)
    "The plane has taken off"
  end
end
