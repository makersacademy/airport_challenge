require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 3
    
  attr_reader :name
  attr_reader :capacity

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Can't land in stormy weather." if stormy? == true
    fail "Airport full. Capacity is #{@capacity}." if @planes.size == @capacity
    fail "Plane already landed." if @planes.include? plane
    @planes << plane
  end

  def take_off(plane)
    fail "Can't fly in stormy weather." if stormy? == true
    fail "Plane already airborne." unless @planes.include? plane
    @planes.pop
  end

  def stormy?
    rand(5) > 4
  end
end
