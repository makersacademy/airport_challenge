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
    raise "That plane is already on the ground!" if plane.on_ground
    
    raise "Landing not permitted: airport full!" if full?

    check_weather("Landing")
    hangar << plane
    plane.report_location(true)
  end

  def take_off(plane)
    raise "That plane is already in the air!" unless plane.on_ground
    
    raise "That plane is at a different airport!" unless contains?(plane)

    check_weather("Take off")
    hangar.delete(plane)
    plane.report_location(false)
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
