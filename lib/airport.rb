require './lib/Plane.rb'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def take_off
    planes.pop
  end

end
