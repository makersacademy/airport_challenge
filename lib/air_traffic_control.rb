require 'plane'

class AirTrafficControl
  attr_accessor :planes, :stormy, :capacity

  def initialize(planes = [], stormy = false, capacity = 20)
    @planes = planes
    @stormy = stormy
    @capacity = capacity
  end

  def land(plane, stormy = @stormy)
    raise "Airport full, can't land now!" if full?
    @planes << (plane) unless stormy
    raise "Stormy weather, can't land now!" if stormy
  end

  def take_off(plane, stormy = @stormy)
    @planes.delete(plane) unless stormy
    raise "Stormy weather, can't take off now!" if stormy
  end

  def full?
    return true if @planes.count == @capacity
  end

  private :full?
end
