require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes_landed

  def initialize
    @planes_landed = []
  end

  def landing_order(plane)
    @planes_landed << plane.land
  end

  def take_off_order(plane)
    @planes_landed.delete(plane)
  end




end
