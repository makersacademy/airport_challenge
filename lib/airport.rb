require_relative 'plane.rb'
class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    raise "The airport is full" if @planes.length == 1
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

end
