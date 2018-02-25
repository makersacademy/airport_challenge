require './lib/plane.rb'

class Airport
  attr_accessor :landed_planes, :capacity
  DEFAULT_CAPACITY = 100
  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    raise Exception.new('Cannot land; you are already on the ground!') if plane.location != 'in_flight'
    raise Exception.new('Cannot land in stormy weather!') if stormy?
    raise Exception.new('Cannot land; the airport is full!') if full?
    plane.location = self
    @landed_planes << Plane.new
    Plane.new
  end

  def take_off(plane)
    raise Exception.new('Cannot take off in stormy weather!') if stormy?
    raise Exception.new('Cannot allow take off; you are contacting the wrong control tower!') if plane.location != self
    @landed_planes.delete(plane)
    plane.location = 'in_flight'
  end


  def full?
    @landed_planes.length >= @capacity
  end

  def stormy?
    rand(1..100) >= 90
  end
end
