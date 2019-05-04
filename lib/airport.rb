require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    "Cleared to land"
  end

  def take_off
    "Cleared for take off"
    planes.pop
  end
end
