require_relative 'plane.rb'
class Airport

  attr_reader :capacity

  def initialize(capacity = 20)
    @capacity = capacity
    @hangar = []
  end

  def takeoff
    raise "There are no planes currently in the hangar." if @hangar.empty?

    raise "The weather is too stormy to take off." if stormy?

    return @hangar.pop
  end

  def land(plane)
    raise "There is not enough space to land another plane!" if @hangar.length >= @capacity

    raise "The weather is too stormy to land." if stormy?

    @hangar << plane
    return @hangar.last
  end

  def stormy?
    rand(1..3) == 1
  end
end
