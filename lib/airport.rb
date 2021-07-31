require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :hangar, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    raise "Airport capacity must be a positive integer" if not_positive_integer?(capacity)

    @capacity = capacity
    @hangar = Array.new
    @weather = Weather.new
  end

  def land(plane)
    check_weather("Landing")
    raise "Landing not permitted: airport full!" if full?

    hangar << plane
  end

  def take_off(plane)
    check_weather("Take off")
    hangar.delete(plane)
  end

  def contains?(plane)
    hangar.include?(plane)
  end

  private

  def not_positive_integer?(capacity)
    !capacity.is_a?(Integer) || capacity < 1
  end

  def full?
    hangar.size == @capacity
  end

  def check_weather(action)
    raise "#{action} not permitted when weather is stormy" if weather.stormy?
  end

end
