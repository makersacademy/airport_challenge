require_relative 'plane'

class Airport

  attr_accessor :planes
  #@@planes = Array.new

  def initialize
    @planes = Array.[](Plane.new true)
  end

  def take_off_order plane
    plane.last.take_off
  end

  def landing_order plane
    #plane.land self
    @planes << plane
  end

  def release plane
    @planes.pop

  end


end
