require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize 
    @plane = []
  end

  def land(plane)
    fail "Airport is full" if @plane.size >= 20
    @plane << plane
  end

  def take_off
  end

end