require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def accept(plane)
    #plane.land
    planes.push(plane)
  end

  def plane_take_off
    planes.pop
  end

  private
  attr_reader :planes

end
