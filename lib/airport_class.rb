require "plane_class.rb"
class Airport 
  attr_accessor :planes
  attr_accessor :capacity
  AIRPORT_CAPACITY = 5
  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "The plane cannot land as the airport is full" if @planes.length >= capacity
    @planes.push(plane)
    puts @planes
  end

  def take_off(plane)
    @planes.delete(plane)
  end
end
