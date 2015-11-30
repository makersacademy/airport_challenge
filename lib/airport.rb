require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes_landed

  def initialize
    @planes_landed = []
  end

  def landing_order(plane)
    planes_landed << plane
    plane.land(self)
  end

  def take_off_order(plane)
    planes_landed.delete(plane)
    plane.take_off
  end


end
