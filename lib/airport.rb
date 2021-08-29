require_relative "plane"

class Airport
  
  attr_reader :planes

  def initialize 
    @planes = []
  end

  def land(plane)
    fail "Hangar is full, can't land" if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count >= 20
  end
end
