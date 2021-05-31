require_relative "plane"

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    @hangar
  end
  
  def take_off(plane)
    @hangar.delete(plane)
    @hangar
  end

end
