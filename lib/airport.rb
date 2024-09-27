require_relative 'plane'

class Airport

  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = stormy?
  end

  def land_plane(plane)
    raise "Airport full, there is no space!" if full?
    raise "Too stormy to land!" if stormy?
    plane.land?
    @planes << plane
  end

  def plane_count
    @planes.count
  end

  def take_off(plane)
    raise "Too stormy to take off!" if stormy?
    raise "Airport empty, there are no planes!" if empty?
    plane.take_off
    @planes.delete(plane)
  end

  def stormy?
    rand(1..10) > 8
  end

  private

  def full?
    @planes.count == @capacity
  end

  def empty?
    @planes.count == 0
  end

end
