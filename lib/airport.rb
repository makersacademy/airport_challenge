class Airport

  attr_accessor :planes_on_ground, :stormy

  def initialize
    @planes_on_ground = []
    @stormy = true
  end

  def landing(plane)
    fail 'landing denied, weather is stormy' if stormy == true
    fail 'plane is already in the airport' if included?(plane)
    @planes_on_ground << plane
  end

  def take_off(plane)
    fail 'plane is not currently at this airport' unless included?(plane)
    fail 'weather is stormy, plane can not take off' if @stormy == true
    @planes_on_ground.delete(plane)
  end

  def included?(plane)
    @planes_on_ground.include?(plane)
  end

end
