require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_accessor :planes, :capacity

  def initialize
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    plane.land_plane
    planes << plane
  end

  def take_off
    fail "No planes available" if empty?
    fail "Take off cancelled due to stormy weather" if @stormy
    planes.pop
  end

  def empty?
    planes.empty?
  end
end
