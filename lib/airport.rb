require './lib/plane.rb'

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.land_plane
    planes << plane
  end

  def take_off
    fail "No planes available" if empty?
    planes.pop
  end

  def empty?
    planes.empty?
  end
end
