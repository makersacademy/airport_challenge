require_relative 'plane.rb'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.land
    @planes << plane
  end
end
