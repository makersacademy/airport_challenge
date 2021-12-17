require_relative 'plane'
require_relative 'weather'

class Airport
  CAPACITY = 20

  attr_reader :recent_departure

  def initialize
    @planes = []
  end
  
  def land(plane)
    fail "The plane cannot land as airport is at capacity" if full? == true
    @planes << plane
  end

  def take_off(weather)
    fail "It's too stormy for a plane to take off right now" if weather.stormy? == true
    @recent_departure = @planes.pop
  end

  def gone?
    !@planes.include?(@recent_departure)
  end

  def override_capacity(new_capacity)
    Airport.const_set("CAPACITY", new_capacity)
  end

  private

  def full?
    @planes.count >= CAPACITY
  end
end
