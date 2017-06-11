require_relative 'Plane.rb'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.ground
    self.planes. << plane
  end

end
