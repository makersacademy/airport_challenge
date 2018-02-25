require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 100
  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land
    raise Exception.new('Cannot land in stormy weather!') if stormy?
    raise Exception.new('Cannot land; the airport is full!') if full?
    @landed_planes << Plane.new
    Plane.new
  end

  def take_off
    raise Exception.new('Cannot take off in stormy weather!') if stormy?
    @landed_planes.pop
    Plane.new
  end

  def full?
    @landed_planes.length >= @capacity
  end

  def stormy?
    rand(1..100) >= 90
  end
end
