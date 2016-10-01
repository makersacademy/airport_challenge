require_relative 'plane.rb'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def take_off
    @planes.pop
    "The plane has taken off"
  end

  def land(plane)
    fail "Plane unable to land, airport full" if @planes.count == 5
    @planes << plane
    "The plane landed safely"
  end
end
