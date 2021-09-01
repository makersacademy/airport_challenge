require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize 
    
    @plane = []

  end

  def land(plane)
    raise "Airport is full" if @plane.size >= 20
    raise "Plane cannot land due to stormy weather" if stormy?
    @plane << plane
  end

  def take_off
  end

  def stormy?
    rand(1..3) > 2
  end

end
