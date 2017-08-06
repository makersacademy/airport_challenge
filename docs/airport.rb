require './docs/plane.rb'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def create_planes
    plane = Plane.new
    @planes << plane
  end

  def take_off(plane)
    p "#{plane} has taken off"
    p "#{plane} is no longer at the airort"
    @planes.delete(plane)
# but this does not reset the orignal Airport.new instance which was created
  end

  def landing(plane)
    p "#{plane} has landed" 
  end

end
