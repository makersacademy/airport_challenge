require_relative 'plane'
require_relative 'weather'

class Airport
attr_accessor :planes_landed

  def initialize
    @planes_landed = []
  end

  def landing_order(plane)
    planes_landed << plane
  end

  def take_off_order(plane)
    planes_landed.delete_if{|x| x == plane.take_off}
  end




end
