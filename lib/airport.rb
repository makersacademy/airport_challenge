class Airport

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end
  def take_off
    @hangar.pop
  end
end
