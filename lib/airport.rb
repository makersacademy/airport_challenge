require_relative 'plane'

class Airport
  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 80

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full!" if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    "This plane is no longer in the airport!" unless @planes.include?(plane) 
  end

  private

  def full?
    @planes.length >= @capacity
  end
end