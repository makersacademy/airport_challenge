require_relative 'plane'

class Airport
  attr_reader :plane, :capacity

  def initialize(capacity = 1)
    @capacity = capacity
  end

  def land(plane)
    @plane ? (raise "Airport full.") : @plane = plane
  end

  def take_off(plane)
    @plane = nil
  end

  def in_air?(plane)
    @plane == plane
  end    
end 