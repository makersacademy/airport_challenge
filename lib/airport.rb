require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100
  
  attr_reader :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def planes_in_airport
    puts @planes
  end

  private

  def full?
    @planes.count >= @capacity
  end
end

