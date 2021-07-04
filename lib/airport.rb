 require_relative "plane"

 class Airport
  attr_accessor :capacity
  attr_reader :airport
  attr_reader :plane
  attr_reader :conditions

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
    @conditions = ["Stormy", "Clear"]
  end

  def land(plane)
    fail "Airport full; cannot land plane." if full?
    @airport << plane
  end

  def take_off
    fail "Airport empty; cannot take off." if empty?
    @airport.pop
  end

  def full?
    @airport.count >= DEFAULT_CAPACITY
  end

  def empty?
    @airport.empty?
  end
end
