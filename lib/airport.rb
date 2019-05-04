require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
    "Cleared to land"
  end

  def take_off
    planes.pop
    "Cleared for take off"
  end
end
