class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    plane.land
    @hangar << plane
  end

  def take_off(plane)
    plane.take_off
    @hangar.delete(plane)
  end
end