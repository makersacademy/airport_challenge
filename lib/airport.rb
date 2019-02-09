require_relative 'plane.rb'
class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "The airport is full" if @planes.length == @capacity

    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

end
