require_relative 'plane2'

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
    storm_chance = rand(5)
    true if storm_chance == 0 # 20 percent chance of storm
  end

end
