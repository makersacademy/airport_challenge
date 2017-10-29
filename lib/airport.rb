class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off
    plane = @hangar[-1]
    @hangar.pop
    "#{plane} has taken off"
  end
end
