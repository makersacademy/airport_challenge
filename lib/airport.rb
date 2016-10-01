require_relative 'plane.rb'

class Airport
  attr_reader = :planes

  def initialize
    @planes = []
  end

  def take_off
    @planes.pop
    "The plane has taken off"
  end

  def land(plane)
    @planes << plane
    "The plane landed safely"
  end
end
