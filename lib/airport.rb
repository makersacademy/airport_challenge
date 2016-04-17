require "plane"

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes= []
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Stormy cannot land" if stormy?
    planes << plane
    landed?
  end

  def take_off
    fail "Cannot take off" if stormy?
    planes.pop
  end

  def landed?
    true
  end

  def departed?
    true
  end

  def full?
    planes.count >= capacity
  end

   def stormy?
    rand(1..2) == 1
   end

  private
   attr_reader :planes
end