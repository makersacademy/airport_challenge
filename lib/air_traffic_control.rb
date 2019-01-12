require 'plane'

class AirTrafficControl
  attr_accessor :planes, :stormy
  @planes = Array.new

  def initialize(planes = [], stormy = false)
    @planes = planes
    @stormy = stormy
  end

  def land(plane, stormy = @stormy)
    @planes << (plane) unless stormy
    raise "Stormy weather, can't land now!" if stormy
  end

  def take_off(plane, stormy = @stormy)
    @planes.delete(plane) unless stormy
    raise "Stormy weather, can't take off now!" if stormy
  end
end
