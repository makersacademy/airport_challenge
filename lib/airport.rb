require_relative "plane"

class Airport
  
  attr_reader :planes

  def initialize 
    @planes = []
  end

  def land(plane)
    fail "Hangar is full, can't land" if @planes.count >= 20
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end
end
