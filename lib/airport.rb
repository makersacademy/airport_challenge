class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end

  def take_off(plane)
    p "plane #{plane.object_id} has successfully left the airport"
  end

end
