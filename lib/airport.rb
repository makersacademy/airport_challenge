require_relative 'plane'

class Airport
  attr_reader :capacity, :landed_planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def full?
    true if @landed_planes.count >= @capacity
  end

  def stormy?
    generator = rand(10)
    true if generator.zero? # 10% chance of stormy weather
  end
end
