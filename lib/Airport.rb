class Airport

  def initialize
    @hangar = []
  end

  def land(plane)
  @hangar.push(plane)
  end

  def take_off
  @hangar.pop
  return "plane has left the airport"
  end
end
