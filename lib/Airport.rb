require_relative 'Plane.rb'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    self.planes << plane
  end
end
