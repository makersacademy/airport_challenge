require "plane_class.rb"
class Airport 
  attr_accessor :planes
  AIRPORT_CAPACITY = 5
  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail "The plane cannot land as the airport is full" if @planes.length >= AIRPORT_CAPACITY
    @planes.push(plane)
    puts @planes
  end

  def take_off(plane)
    @planes.delete(plane)
  end
end
