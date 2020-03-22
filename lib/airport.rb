require './lib/plane'

class Airport
  attr_reader :num_planes
  attr_reader :capacity
  self::MAX_PLANES = 10

  def initialize
    @num_planes = []
    @capacity = MAX_PLANES
  end

  def take_off
    fail "No planes available to fly" if @num_planes.empty?
    @num_planes.pop
  end

  def land(plane)
    fail "Aiport full, cannot land!" if @num_planes.count >= MAX_PLANES
    @num_planes.push(plane)
  end
end
