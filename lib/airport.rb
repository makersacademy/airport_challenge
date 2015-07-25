require_relative 'plane'

class Airport

  attr_accessor :planes
  #@@planes = Array.new

  def initialize
    @planes = Array.[](Plane.new true)
  end

  def take_off_order plane
    @planes.last.take_off
  end

  def landing_order plane
    @planes.last.land self
    @planes << plane
  end

  def receive plane
  end

  def release plane
    @planes.pop
  end


end
