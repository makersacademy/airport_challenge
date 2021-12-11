require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    raise "AIRPORT AT FULL CAPACITY!" if at_capacity?
    @planes << plane
  end

  def instruct_take_off
    @planes.pop
  end

  private

  def at_capacity?
    @planes.size >= DEFAULT_CAPACITY
  end

end
