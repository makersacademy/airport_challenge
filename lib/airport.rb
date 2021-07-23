require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = 0
    @hangar = []

  end

  def land(plane)
    raise "Cannot land plane. Airport is full." if @planes_landed >= @capacity
    @planes_landed += 1
    @hangar.push(plane)
  end

  def take_off(plane)
    @hangar.pop
  end

end

