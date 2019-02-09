require_relative 'plane.rb'
class Airport
  attr_reader :planes
  def initialize
    @planes = []
    @capacity = 1
  end

  def land_plane(plane)
    raise "The airport is full" if @planes.length == @capacity
    
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

end
