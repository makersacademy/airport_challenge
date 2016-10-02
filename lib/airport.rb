require_relative 'plane'

class Airport
  attr_reader :landed_planes, :capacity
  attr_accessor :stormy_weather

  DEFAULT_CAPACITY = 40

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
    @stormy_weather = false
  end

  def full
    landed_planes.count > capacity
  end

end
