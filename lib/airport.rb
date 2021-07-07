require_relative 'plane.rb'

class Airport
  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'Airport is at full capacity' if full_capacity?

    @planes << plane
  end

  def take_off(plane)

  end

  private

  def full_capacity?
    @planes.count >= DEFAULT_CAPACITY
  end
end
