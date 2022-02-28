require_relative 'weather'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @airport_deposit = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Weather is stormy. No landing is is allowed!" if stormy?
    raise "Capacity is at it's fullest" if full?
    return @airport_deposit << plane
  end

  def take_off(plane)
    raise "Weather is stormy. No takeoff is allowed!" if stormy?
    @airport_deposit.delete(plane) if @airport_deposit.include?(plane)
  end

  def stormy? 
    # Return true or false
    return @weather.stormy?
  end

  def full?
    @airport_deposit.length >= @capacity
  end
end
