class Airport
  attr_reader :hangar, :weather
  def initialize
    @hangar = []
    @weather = "stormy"
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    "#{plane} has taken off"
  end
end
