require_relative 'plane.rb'
require_relative 'weather'

class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def let_plane_to_take_off(plane)
    fail "Due to stormy weather, plane cannot take off" if !Weather.new.sunny?
    fail "Plane is not at the airport" if !@planes.include?(plane)
    take_off(plane)
  end

  def let_plane_to_land(plane)
    fail "Due to stormy weather, plane cannot land" if !Weather.new.sunny?
    fail "Airport is full, plane cannot land at this airport" if full?
    land(plane)
  end

  private
  #check whether the airport is full or not
  def full?
    @planes.size >= @capacity
  end

  def take_off(plane)
    plane.take_off #calls the take_off method on the plane object
    @planes.delete(plane) #delete the plane in the @planes ivar
    "The plane has left the airport" #confirmation message is returned
  end

  def land(plane)
    plane.land #calls the land method on the plane object
    @planes << plane #add the plane to the @planes ivar
    "The plane has landed" #confirmation message is returned
  end

end
