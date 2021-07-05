 require_relative "plane"
 require_relative "weather"

 class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full; cannot land plane." if full?
    Weather.new.conditions
    @airport << plane
  end

  def take_off
    fail "Airport empty; cannot take off." if empty?
    Weather.new.conditions
    @airport.pop
  end

  def full?
    @airport.count >= DEFAULT_CAPACITY
  end

  def empty?
    @airport.empty?
  end
end
