require 'weather'

class Airport

  attr_accessor :planes_on_ground

  def initialize
    @planes_on_ground = []
  end

  def landing(plane_landing)
    @planes_on_ground << plane_landing
  end

  def take_off(plane_taking_off)
    @planes_on_ground.delete(plane_taking_off)
  end

end
