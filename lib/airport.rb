class Airport

  attr_accessor :planes_on_ground, :stormy

  def initialize
    @planes_on_ground = []
    @stormy = true
  end

  def landing(plane_landing)
    @planes_on_ground << plane_landing
  end

  def take_off(plane_taking_off)
    fail 'weather is stormy, plane can not take off' if @stormy == true
    @planes_on_ground.delete(plane_taking_off)
  end

end
