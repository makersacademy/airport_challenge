class Airport

  attr_reader :plane, :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    @plane = plane
  end

end
