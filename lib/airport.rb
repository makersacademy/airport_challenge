class Airport

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def takeoff(plane)
    fail 'Plane not at this airport' unless @hangar.include?(plane)
    @hangar.delete(plane)
  end

end
